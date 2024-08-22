//
//  Header.swift
//  Restaurant
//
//  Created by Oscar Suarez on 10/07/2024.
//

import SwiftUI

struct Header: View {
    var iconProfile: String
    var body: some View {
        HStack {
            Image("Logo")
            Image(iconProfile)
                .resizable()
                .frame(width: 60, height: 60)
        }
        .padding()
    }
}

#Preview {
    Header(iconProfile: "Profileguess")
}
