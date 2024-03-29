//
//  ContentView.swift
//  LoginScreen
//
//  Created by Admin on 10/27/21.
//

import SwiftUI

struct PortalView: View {
    @State var isLoginMode = false
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
        NavigationView {
            ScrollView{
                VStack(spacing: 16) {
                    Picker(selection: $isLoginMode, label:
                            Text("Picker here")) {
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)//sets default
                    }
                            .pickerStyle(SegmentedPickerStyle())
                    if !isLoginMode {
                        Button {
                        } label: {
                            Image(systemName: "person.fill")
                                .font(.system(size:64))
                                .padding()
                        }
                    }
                    Group {
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        //                        .padding(12)
                        //                        .background(Color.white)
                        SecureField("Password", text: $password)
                        //                        .padding(12)
                        //                        .background(Color.white)
                        
                    }
                    .padding(12)
                    .background(Color.white)
                    Button {
                        handleAction()
                    } label: {
                        HStack {
                            Spacer()
                            Text(isLoginMode ? "Log In" : "Create Account")
                                .foregroundColor(.white)
                                .padding(.vertical,10)
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                        }.background(Color.blue)
                    }
                }
                .padding()
            }
            .navigationTitle(isLoginMode ? "Log In" : "Create Account")
            .background(Color(.init(white:0, alpha:0.05)).ignoresSafeArea())
        }
    }
    
    private func handleAction() {
        if isLoginMode {
            print("Should log into Firebase with existing credentials")
        } else {
            print("Register a new account inside of Firebase Auth and then store image in storage")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PortalView()
    }
}
