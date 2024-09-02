//
//  UserProfile.swift
//  Restaurant
//
//  Created by Oscar Suarez on 08/08/2024.
//

import SwiftUI

struct UserProfile: View {
    @StateObject private var viewModel = ViewModel()
    
    @Environment(\.presentationMode) var presentation
    
    @State private var orderStatuses = true
    @State private var passwordChanges = true
    @State private var specialOffers = true
    @State private var newsletter = true
    
    @State private var name = ""
//    @State private var lastName = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    
    @State private var isLoggedOut = false
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, content: {
                        Text("Personal Information")
                            .font(.sectionSubTitleFont())
                            .foregroundColor(.darkGrayLL)
                    })
                    VStack(alignment: .leading) {
                        Text("Avatar")
                            .font(.headlineFont())
                        HStack(spacing: 0) {
                            Image("Profileguess")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(maxHeight: 75)
                                .clipShape(Circle())
                                .padding(.trailing)
                            Button("Change") { }
                                .buttonStyle(ButtonDesignGreen())
                            Button("Remove") { }
                                .buttonStyle(ButtonDesignGreenReverse())
                            Spacer()
                        }
                    }
                    
                    VStack(alignment: .leading){
                        Text("Full name")
                            .font(.headlineFont())
                        TextField("FullName", text: $name)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("E-mail")
                            .font(.headlineFont())
                        TextField("E-mail", text: $email)
                            .keyboardType(.emailAddress)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Phone number")
                            .font(.headlineFont())
                        TextField("Phone number", text: $phoneNumber)
                            .keyboardType(.default)
                    }
                }
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
                .padding()
                VStack(alignment: .leading, content: {
                    Text("Email notifications")
                        .font(.sectionSubTitleFont())
                        .foregroundColor(.darkGrayLL)
                })
                HStack{
                    VStack (alignment: .leading){
                        Toggle("Order statuses", isOn: $orderStatuses)
                            .toggleStyle(CheckboxToggle())
                        Toggle("Password changes", isOn: $passwordChanges)
                        Toggle("Special offers", isOn: $specialOffers)
                        Toggle("Newsletter", isOn: $newsletter)
                    }
                    .toggleStyle(CheckboxToggle())
                    .padding()
                    .font(Font.headlineFont())
                    .foregroundColor(.greenLL)
                    Spacer()
                }
                Button("Log out") {
                    UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                    UserDefaults.standard.set("", forKey: kName)
                    UserDefaults.standard.set("", forKey: kEmail)
                    UserDefaults.standard.set("", forKey: kPhoneNumber)
                    UserDefaults.standard.set(false, forKey: kOrderStatuses)
                    UserDefaults.standard.set(false, forKey: kPasswordChanges)
                    UserDefaults.standard.set(false, forKey: kSpecialOffers)
                    UserDefaults.standard.set(false, forKey: kNewsletter)
                    isLoggedOut = true
                }
                .buttonStyle(ButtonDesignYellow())
                Spacer(minLength: 20)
                HStack {
                    Button("Discard Changes") {
                        name = viewModel.name
                        
                        email = viewModel.email
                        phoneNumber = viewModel.phoneNumber
                        
                        orderStatuses = viewModel.orderStatuses
                        passwordChanges = viewModel.passwordChanges
                        specialOffers = viewModel.specialOffers
                        newsletter = viewModel.newsletter
                        self.presentation.wrappedValue.dismiss()
                    }
                    .buttonStyle(ButtonDesignGreenReverse())
                    Button("Save changes") {
                        if viewModel.validateUserInput(name: name, email: email, phoneNumber: phoneNumber) {
                            UserDefaults.standard.set(name, forKey: kName)
                            
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
                            UserDefaults.standard.set(orderStatuses, forKey: kOrderStatuses)
                            UserDefaults.standard.set(passwordChanges, forKey: kPasswordChanges)
                            UserDefaults.standard.set(specialOffers, forKey: kSpecialOffers)
                            UserDefaults.standard.set(newsletter, forKey: kNewsletter)
                            self.presentation.wrappedValue.dismiss()
                        }
                    }
                    .buttonStyle(ButtonDesignGreen())
                }
                if viewModel.errorMessageShow {
                    withAnimation() {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                    }
                }
                
            }
            .onAppear {
                name = viewModel.name
                //            lastName = viewModel.lastName
                email = viewModel.email
                phoneNumber = viewModel.phoneNumber
                
                orderStatuses = viewModel.orderStatuses
                passwordChanges = viewModel.passwordChanges
                specialOffers = viewModel.specialOffers
                newsletter = viewModel.newsletter
            }
            .navigationDestination(isPresented: $isLoggedOut) {
                Onboarding()
                
            }
        }
        .navigationTitle(Text("Personal information"))
        .navigationBarTitleDisplayMode(.inline)
    }
        
}


#Preview {
    UserProfile()
}
