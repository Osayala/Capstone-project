//
//  DetailItem.swift
//  Restaurant
//
//  Created by Oscar Suarez on 01/08/2024.
//

import SwiftUI

struct DetailItem: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    let dish: Dish
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .clipShape(Rectangle())
            .frame(minHeight: 150)
            Text(dish.title ?? "")
                .font(.subTitleFont())
                .foregroundStyle(.gray)
            Spacer(minLength: 20)
            Text(dish.descriptionDish ?? "")
                .font(.foodListTitleFont())
            Spacer(minLength: 10)
            Text("$" + (dish.price ?? ""))
                .font(.foodListTitleFont())
                .foregroundColor(.gray)
                .monospaced()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
    }
}

#Preview {
    DetailItem(dish: PersistenceController.oneDish())
}
