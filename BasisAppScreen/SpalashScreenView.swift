//
//  SpalashScreenView.swift
//  BasisAppScreen
//
//  Created by Ling on 2021/7/2.

import SwiftUI

struct SpalashScreenView<MainView: View, LogoView: View, TitleView: View, NavButtonView: View, LoginView: View>: View {
    let mainView: MainView
    let logoView: LogoView
    let titleView: TitleView
    let navButtonView: NavButtonView
    let loginView: LoginView
    
    @Binding var imageSize: CGSize
    @Binding var viewType: ViewType
    @Binding var isProgress: Bool
    
    @State var logoAnimation: Bool = false
    @State var logoMoveAnimation: Bool = false
    @State var wordsAnimation: Bool = false
    
    @Namespace var animation

    init(
        @ViewBuilder mainView: @escaping() -> MainView,
        @ViewBuilder logoView: @escaping() -> LogoView,
        @ViewBuilder titleView: @escaping() -> TitleView,
        @ViewBuilder navButtonView: @escaping() -> NavButtonView,
        @ViewBuilder loginView: @escaping() -> LoginView,
        imageSize: Binding<CGSize>,
        viewType: Binding<ViewType>,
        isProgress: Binding<Bool>) {
        
        self.mainView = mainView()
        self.logoView = logoView()
        self.titleView = titleView()
        self.navButtonView = navButtonView()
        self.loginView = loginView()
        
        self._imageSize = imageSize
        self._viewType = viewType
        self._isProgress = isProgress
    }
    
    var body: some View {
        ZStack {
        VStack(spacing: 0) {
            switch viewType {
            case .autoLogin:
                // 從 logo view > 主畫面
                autoLiginSpalashScreen()
                    .background(Color("BgColor").edgesIgnoringSafeArea(.all))
                    .frame(maxHeight: .infinity, alignment: .top)
                    .onAppear(perform: {
                        initAutoLiginSpalashScreenAnimation()
                    }) // end onAppear
            case .login:
                // 從 登入畫面 > 主畫面
                loginSpalashScreen()
                    .background(Color("BgColor").edgesIgnoringSafeArea(.all))
                    .frame(maxHeight: .infinity, alignment: .top)
                    .onAppear(perform: {
                        initloginSpalashScreenAnimation()
                    }) // end onAppear
            case .nologin:
                // 從 logo view > 登入畫面
                self.loginView
                    .onAppear(perform: {
                        // 初始化動畫
                        logoAnimation = false
                        logoMoveAnimation = false
                        wordsAnimation = false
                    })
            default:
                EmptyView()
            }
        } // end VStack
            
            if isProgress {
                SystemProgressView()
            }
        }
    }
    
    func autoLiginSpalashScreen() -> some View {
        VStack(spacing: 0) {
            
            ZStack {
                Color("BgColor").edgesIgnoringSafeArea(.all)
                
                titleView
                    .opacity(wordsAnimation ? 1 : 0)
                
                if !logoAnimation {
                    logoView
                        .matchedGeometryEffect(id: "LOGO", in: animation)
                        .frame(width: imageSize.width, height: imageSize.height)
                }
                
                HStack {
                    
                    if logoMoveAnimation {
                        navButtonView
                            .padding(.leading)
                        Spacer()
                    }
                    if logoAnimation {
                        logoView
                            .matchedGeometryEffect(id: "LOGO", in: animation)
                            .frame(width: imageSize.width, height: imageSize.height)
                            .padding(.trailing)
                    }
                }
            } // end ZStack
            .frame(height: logoAnimation ? 60 : nil)
            .zIndex(1)
            
            if logoMoveAnimation {
                Divider()
            }
            
            /* content */
            mainView
                .frame(height: logoAnimation ? nil : 0)
                .zIndex(0)

        } // end VStack
    }
    
    func initAutoLiginSpalashScreenAnimation() {
        /* logo 與 title 文字狀態
         * 先縮小往上移，再往右移 title文字再出現
         */
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(.spring()) {
                imageSize.width = 30
                imageSize.height = 30
            } // end withAnimation
            
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 1, blendDuration: 1)) {
                logoAnimation.toggle()
            } // end withAnimation
        } // end asyncAfter
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 1, blendDuration: 1)) {
                logoMoveAnimation.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation(.linear) {
                        wordsAnimation.toggle()
                    }
                }
            } // end withAnimation
        } // end asyncAfter
    }
    
    func loginSpalashScreen() -> some View {
        VStack(spacing: 0) {
            
            ZStack {
                Color("BgColor").edgesIgnoringSafeArea(.all)
                
                titleView
                    .opacity(wordsAnimation ? 1 : 0)
                
                HStack {
                    
                    if logoMoveAnimation {
                        navButtonView
                            .padding(.leading)
                        Spacer()
                    }

                    logoView
                        .matchedGeometryEffect(id: "LOGO", in: animation)
                        .frame(width: imageSize.width, height: imageSize.height)
                        .padding(.trailing)

                }
            } // end ZStack
            .frame(height: 60)
            .zIndex(1)
            
            Divider()
            
            /* content */
            mainView
                .zIndex(0)

        } // end VStack
    }
    
    func initloginSpalashScreenAnimation() {
        // 只移動導覽列
        imageSize.width = 30
        imageSize.height = 30
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 1, blendDuration: 1)) {
                logoMoveAnimation.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation(.linear) {
                        wordsAnimation.toggle()
                    }
                }
            } // end withAnimation
        } // end asyncAfter
    }
    
    
}

struct SpalashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView(viewType: .constant(.login))
            .preferredColorScheme(.light)
        
        ContentView(viewType: .constant(.nologin))
            .preferredColorScheme(.light)
        
        ContentView(viewType: .constant(.autoLogin))
            .preferredColorScheme(.dark)
        
    }
}
