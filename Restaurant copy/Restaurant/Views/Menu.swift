//
//  Menu.swift
//  
//
//  Created by Oscar Suarez on 18/06/2024.
//

import SwiftUI
import CoreData

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State var startersIsEnabled = true
    @State var mainsIsEnabled = true
    @State var dessertsIsEnabled = true
    @State var drinksIsEnabled = true
    
    @State var searchText = ""
    
    @State var loaded = false
    
    @State var isKeyboardVisible = false
    
    var body: some View {
        
        VStack{
            VStack{
                Hero()
                TextField("Search menu", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding()
//                    .padding(.bottom)
            }
                .background(.greenLL)
//                .frame(height: 280)
            Text("ORDER DELIVERY!")
                .font(.sectionTitleFont())
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
                .padding(.horizontal)
            ScrollView(.horizontal){
                HStack{
                    Button(action: {
                        startersIsEnabled.toggle()
                    }) {
                        Text("Started")
                            .scaleEffect(startersIsEnabled ? 1.2: 1.0)
                            .foregroundColor(startersIsEnabled ? Color.greenLL: Color.white)
                    }
                    Button(action: {
                        mainsIsEnabled.toggle()
                    }) {
                        Text("Mains")
                            .scaleEffect(mainsIsEnabled ? 1.2: 1.0)
                            .foregroundColor(mainsIsEnabled ? Color.greenLL: Color.white)
                    }
                    Button(action: {
                        dessertsIsEnabled.toggle()
                    }) {
                        Text("Desserts")
                            .scaleEffect(dessertsIsEnabled ? 1.2: 1.0)
                            .foregroundColor(dessertsIsEnabled ? Color.greenLL: Color.white)
                    }
                    Button(action: {
                        drinksIsEnabled.toggle()
                    }) {
                        Text("Drinks")
                            .scaleEffect(drinksIsEnabled ? 1.2: 1.0)
                            .foregroundColor(drinksIsEnabled ? Color.greenLL: Color.white)
                    }
                }
                
                .buttonStyle(.bordered)
                .tint(.greenLL)
                .bold()
                .padding(.horizontal)
                
                Divider()
            }
            
            FetchedObjects(predicate: buildPredicate(),
                           sortDescriptors: buildSortDescriptors()) {
                (dishes: [Dish]) in
                List(dishes) { dish in
                    NavigationLink(destination: DetailItem(dish: dish)) {
                        FoodItem(dish: dish)
                    }
                }
                .listStyle(.plain)
            }
        }
        .onAppear {
            if !loaded {
                MenuList.getMenuData(viewContext: viewContext)
                loaded = true
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { notification in
            withAnimation {
                self.isKeyboardVisible = true
            }
            
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { notification in
            withAnimation {
                self.isKeyboardVisible = false
            }
        }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title",
                                  ascending: true,
                                  selector:
                                    #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSCompoundPredicate {
        let search = searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        let starters = !startersIsEnabled ? NSPredicate(format: "category != %@", "starters") : NSPredicate(value: true)
        let mains = !mainsIsEnabled ? NSPredicate(format: "category != %@", "mains") : NSPredicate(value: true)
        let desserts = !dessertsIsEnabled ? NSPredicate(format: "category != %@", "desserts") : NSPredicate(value: true)
        let drinks = !drinksIsEnabled ? NSPredicate(format: "category != %@", "drinks") : NSPredicate(value: true)

        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [search, starters, mains, desserts, drinks])
        return compoundPredicate
    }
}

#Preview {
    Menu().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
