//
//  Home.swift
//  
//
//  Created by Oscar Suarez on 14/06/2024.
//

import SwiftUI

struct Home: View {
    var body: some View {
            VStack{
                Header(iconProfile: "Profileguess")
                Hero()
                Menu()
        }
        Spacer()
    }
}

#Preview {
    Home()
}
