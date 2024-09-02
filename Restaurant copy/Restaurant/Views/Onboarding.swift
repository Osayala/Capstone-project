//
//  Onboarding.swift
//  
//
//  Created by Oscar Suarez on 12/06/2024.
//

import SwiftUI
//let kFirstName = "first name key"
let emailDefault = "email key"


struct Onboarding: View {
    @StateObject private var viewModel = ViewModel()
    
    @State var name: String = ""
    @State var email: String = ""
    @State var phoneNumber: String = ""

    @State var showcreateNote: Bool = false
    @State var isLoggedIn: Bool = false
    @State var isKeyboardVisible = false
    @State var contentOffset: CGSize = .zero
    
   
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    
                    Image("Logo")
                    Hero()
                        .padding(.bottom)
                        .background(.greenLL)
                      
                    NavigationStack{
                        VStack(alignment: .leading){
                            Text("Full name *")
                                .font(.system(size: 20, design: .serif))
                                .foregroundStyle(.gray)
                            TextField("Name", text:$name)
                            Text("Email *")
                                .font(.system(size: 20, design: .serif))
                                .foregroundStyle(.gray)
                            TextField("email", text:$email)
                        }
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        if viewModel.errorMessageShow {
                            withAnimation() {
                                Text(viewModel.errorMessage)
                                    .foregroundColor(.red)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading)
                            }
                        }
                    }
                    Button("Register"){
                        if viewModel.validateUserInput(name: name,  email: email, phoneNumber: phoneNumber ) {
                            UserDefaults.standard.set(name, forKey: kName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                            UserDefaults.standard.set(true, forKey: kOrderStatuses)
                            UserDefaults.standard.set(true, forKey: kPasswordChanges)
                            UserDefaults.standard.set(true, forKey: kSpecialOffers)
                            UserDefaults.standard.set(true, forKey: kNewsletter)
                            name = ""
                            email = ""
                            isLoggedIn = true
                        }
                    }
                    .buttonStyle(ButtonDesignYellow())
                    Spacer()
                }
                
                
                .offset(y: contentOffset.height)
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { notification in
                    withAnimation {
                        let keyboardRect = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                        let keyboardHeight = keyboardRect.height
                        self.isKeyboardVisible = true
                        self.contentOffset = CGSize(width: 0, height: -keyboardHeight / 2 + 50)
                    }
                    
                }
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { notification in
                    withAnimation {
                        self.isKeyboardVisible = false
                        self.contentOffset = .zero
                    }
                }
            }
            .onAppear() {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
            .navigationDestination(isPresented: $isLoggedIn) {
                Home()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    Onboarding()
}
