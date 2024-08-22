//
//  Hero.swift
//  Restaurant
//
//  Created by Oscar Suarez on 04/07/2024.
//

import SwiftUI

struct Hero: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(.greenLL))
                .frame(height: 280)
            
                VStack(alignment: .leading, spacing: 6){
                    Text("Litte Lemon")
                        .font(.system(size: 48, design: .serif))
                        .foregroundStyle(.yellowLL)
                        .fontDesign(.serif)
                    HStack(alignment: .bottom, spacing: 3){
                        VStack(alignment: .leading, spacing: 6){
                            Text("Cork")
                                .font(.title)
                                .foregroundStyle(.gray)
                            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .lineSpacing(5)
                            
                        }
                        .padding(5)
                        
                        Image("Hero image")
                            .resizable()
                            .frame(width: 130, height: 130)
                            .cornerRadius(10.0)
                        
                    }
            }
            .padding()
        }
    }
}

#Preview {
    Hero()
}
