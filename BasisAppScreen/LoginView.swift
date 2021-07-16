//
//  LoginView.swift
//  BasisAppScreen
//
//  Created by Ling on 2021/7/15.
//

import SwiftUI

struct LoginView: View {
    @Binding var viewType: ViewType
    
    @State var account: String = ""
    @State var password: String = ""
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                
                VStack {
                    Image("icon")
                }.frame(height: geometry.size.height / 3)
                
                VStack(spacing: 0) {
                    Spacer()
                    HStack {
                        Image(systemName: "person.fill")
                            .foregroundColor(.gray)
                            .padding(.vertical, 15)
                            .padding(.leading, 20)
                        TextField("Account", text: $account)
                            .padding(.vertical, 15)
                            .padding(.leading, 10)
                            .padding(.trailing, 20)
                    }
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)),lineWidth: 1))
                    .padding(.horizontal, 20)
                    Spacer()
                    HStack {
                        Image(systemName: "lock.fill")
                            .foregroundColor(.gray)
                            .padding(.vertical, 15)
                            .padding(.leading, 20)
                        TextField("Password", text: $account)
                            .padding(.vertical, 15)
                            .padding(.leading, 10)
                            .padding(.trailing, 20)
                    }
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)),lineWidth: 1))
                    .padding(.horizontal, 20)
                    Spacer()
                }.frame(height: geometry.size.height / 3)
                
                VStack(spacing: 0) {
                    Button(action: {
                        UserStorage.shared.token = "token"
                        viewType = .login
                    }, label: {
                        Text("Login")
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(12)
                    }).padding(.horizontal, 20)
                }.frame(height: geometry.size.height / 3)
            } // end VStack
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewType: .constant(.nologin))
    }
}
