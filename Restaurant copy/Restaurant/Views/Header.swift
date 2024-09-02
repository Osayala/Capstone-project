//
//  Header.swift
//  Restaurant
//
//  Created by Oscar Suarez on 10/07/2024.
//

import SwiftUI



struct Header: View {
    @State var isLoggedIn = false
    var iconProfile: String
    var body: some View {
        NavigationStack{
            HStack {
                Image("Logo")
                HStack {
                    Spacer()
                    if isLoggedIn {
                        NavigationLink(destination: UserProfile()) {
                            Image(iconProfile)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .aspectRatio( contentMode: .fit)
                                .frame(maxHeight: 50)
                                .clipShape(Circle())
                                .padding(.trailing)
                        }
                    }
                }
            }
        }
        .padding()
        .onAppear() {
            if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                isLoggedIn = true
            } else {
                isLoggedIn = false
            }
        }
    }
}

#Preview {
    Header(iconProfile: "Profileguess")
}
