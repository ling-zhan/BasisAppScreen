//
//  ContentView.swift
//  BasisAppScreen
//
//  Created by Ling on 2021/7/2.
//

import SwiftUI

/*
 * image 90*90 正常 顯示
 * image 40*40 程式裡面大約 41*41
 */

struct ContentView: View {
    
    @Binding var viewType: ViewType
    @State var logoSize: CGSize = CGSize(width: 90, height: 90)
    @State var isMenu: Bool = false
    @State var isProgress: Bool = false
    
    var body: some View {
        
        SpalashScreenView(
            mainView: {
                MainView(isProgress: $isProgress)
            }, logoView: {
                LogoView(size: $logoSize)
            }, titleView: {
                Text("My News")
                    .font(.title2).bold()
                    .foregroundColor(Color("TitleColor"))
            }, navButtonView: {
                NavButtonView(isMenu: $isMenu)
            }, loginView: {
                LoginView(viewType: $viewType)
            } , imageSize: $logoSize, viewType: $viewType, isProgress: $isProgress
        ) // end SpalashScreenView
        
        .fullScreenCover(isPresented: $isMenu, content: {
            MenuView(viewType: $viewType, isView: $isMenu)
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewType: .constant(.login))
            .preferredColorScheme(.light)
        
        ContentView(viewType: .constant(.nologin))
            .preferredColorScheme(.light)
        
        ContentView(viewType: .constant(.autoLogin))
            .preferredColorScheme(.light)
        
        ContentView(viewType: .constant(.login))
            .preferredColorScheme(.dark)
        
        ContentView(viewType: .constant(.nologin))
            .preferredColorScheme(.dark)
        
        ContentView(viewType: .constant(.autoLogin))
            .preferredColorScheme(.dark)
    }
}
