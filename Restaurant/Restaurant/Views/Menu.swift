//
//  Menu.swift
//  
//
//  Created by Oscar Suarez on 18/06/2024.
//

import SwiftUI

struct Menu: View {
    @State var isPressed1: Bool = false
    @State var isPressed2: Bool = false
    @State var isPressed3: Bool = false
    @State var isPressed4: Bool = false
    var body: some View {
        VStack{
            Text("ORDER DELIVERY!")
                .font(.system(size: 22, design: .serif))
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
                .padding(.horizontal)
            ScrollView(.horizontal){
                HStack{
                    Button(action: {
                        isPressed1.toggle()
                    }) {
                        Text("Started")
                            .scaleEffect(isPressed1 ? 1.1: 1.0)
                    }
                    Button(action: {
                        isPressed2.toggle()
                    }) {
                        Text("Mains")
                            .scaleEffect(isPressed2 ? 1.1: 1.0)
                    }
                    Button(action: {
                        isPressed3.toggle()
                    }) {
                        Text("Desserts")
                            .scaleEffect(isPressed3 ? 1.1: 1.0)
                    }
                    Button(action: {
                        isPressed4.toggle()
                    }) {
                        Text("Drinks")
                            .scaleEffect(isPressed4 ? 1.1: 1.0)
                    }
                }
                
//                .animation(.easeInOut, value: isPressed)
                .buttonStyle(.bordered)
                .tint(.greenLL)
                .bold()
                .padding(.horizontal)
                
                Divider()
            }
        }
    }
}

#Preview {
    Menu()
}
