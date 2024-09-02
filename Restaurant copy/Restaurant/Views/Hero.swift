//
//  Hero.swift
//  Restaurant
//
//  Created by Oscar Suarez on 04/07/2024.
//

import SwiftUI

struct Hero: View {
    @State private var searchText = ""
    @State private var searchHide = false
    var body: some View {

                VStack(alignment: .leading, spacing: 6){
                    Text("Little Lemon")
                        .font(.TitleFont())
                        .foregroundStyle(.yellowLL)
                       
                    HStack(alignment: .bottom, spacing: 3){
                        VStack(alignment: .leading, spacing: 6){
                            Text("Cork")
                                .font(.subTitleFont())
                                .foregroundStyle(.gray)
                            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                                .font(.headlineFont())
                                .foregroundStyle(.white)
//                                .lineSpacing(5)

                        }
                        .padding(5)
                        
                        Image("Hero image")
                            .resizable()
                            .frame(width: 130, height: 130)
                            .cornerRadius(10.0)
                    }
                    
            }
                .frame(maxWidth: .infinity, maxHeight: 280)
                .padding(.horizontal)
                
        }
    }

#Preview {
    Hero()
        .background(.greenLL)
}
