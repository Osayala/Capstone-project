//
//  Onboarding.swift
//  
//
//  Created by Oscar Suarez on 12/06/2024.
//

import SwiftUI
let kFirstName = "first name key"
let emailDefault = "email key"


struct Onboarding: View {
    
    @State private var Name: String = ""
   
    @State private var email: String = ""
    @State var showcreateNote: Bool = false
    @State var isLoggedIn: Bool = false
    @State var isKeyboardVisible = false
    
    
    var body: some View {
        NavigationStack{
                NavigationLink(destination: Home()){
                    VStack{
                        Image("Logo")
                        Hero()
                        VStack(alignment: .leading){
                            Text("First name *")
                                .font(.system(size: 20, design: .serif))
                                .foregroundStyle(.gray)
                            TextField("Name", text:$Name)
                            Text("First name *")
                                .font(.system(size: 20, design: .serif))
                                .foregroundStyle(.gray)
                            TextField("email", text:$email)
                        }
                        .padding()
                    }
                    
            }
            .textFieldStyle(.roundedBorder)
            
            .toolbar {
                ToolbarItem(placement: .status) {
                    Button(action: {
                        showcreateNote.toggle()
                        if (Name.isEmpty) {  UserDefaults.standard.set(Name, forKey: kFirstName)
                        } else if (email.isEmpty) {
                            UserDefaults.standard.set(email, forKey: emailDefault)
                        }
                        
                    }, label: {
                        Label("Register", systemImage: "square.and.pencil")
                            .labelStyle(TitleAndIconLabelStyle())
                    })
                    .buttonStyle(.bordered)
                    .tint(.yellow)
                    .bold()
                }
            }
        }
    }
}

#Preview {
    Onboarding()
}
