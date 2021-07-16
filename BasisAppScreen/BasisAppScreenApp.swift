//
//  BasisAppScreenApp.swift
//  BasisAppScreen
//
//  Created by Ling on 2021/7/2.
//

import SwiftUI

@main
struct BasisAppScreenApp: App {
    @State var viewType: ViewType = .nologin
    var body: some Scene {
        WindowGroup {
            ContentView(viewType: $viewType)
                .onAppear(perform: {
                    if UserStorage.shared.token == "" {
                        viewType = .nologin
                    }else {
                        viewType = .autoLogin
                    }
                })
        }
    }
}


enum ViewType {
    case login
    case nologin
    case autoLogin
}
