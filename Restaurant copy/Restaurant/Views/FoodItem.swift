//
//  FoodItem.swift
//  Restaurant
//
//  Created by Oscar Suarez on 31/07/2024.
//

import SwiftUI

struct FoodItem: View {
    
    let dish:Dish
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(dish.title ?? "")
                    .font(.foodListTitleFont())
                    .foregroundStyle(.black)
                Spacer(minLength: 10)
                Text(dish.descriptionDish ?? "")
                    .font(.foodListDetailFont())
                    .foregroundStyle(.gray)
                Spacer(minLength: 5)
                Text("$" + (dish.price ?? ""))
                    .font(.foodListTitleFont())
                    .foregroundStyle(.gray)
            }
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 90, maxHeight: 90)
            .clipShape(Rectangle())
        }
        .padding(.vertical)
        .frame(maxHeight: 150)
    }
}

#Preview {
        FoodItem(dish: PersistenceController.oneDish())
            
}
