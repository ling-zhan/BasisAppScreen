//
//  MenuView.swift
//  BasisAppScreen
//
//  Created by Ling on 2021/7/15.
//

import SwiftUI

struct MenuView: View {
    @Binding var viewType: ViewType
    @Binding var isView: Bool
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {

                ZStack(alignment: .top) {

                    Image("userCoverBg")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width, height: geometry.size.width / 2)
                    
                    Rectangle().background(Color.black).opacity(0.3)
                        .frame(width: geometry.size.width, height: geometry.size.width / 2)
                    
                    VStack {
                        Image("userCover")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width / 5)
                            .clipShape(Circle())
                            .padding(.all,2)
                            .background(Color.white)
                            .clipShape(Circle())
                    }.frame(width: geometry.size.width, height: geometry.size.width / 2)
                    
                    HStack {
                        Button(action: {
                            isView.toggle()
                        }, label: {
                            Image(systemName: "multiply")
                                .foregroundColor(.white)
                                .font(.title)
                                .padding()
                        })
                        Spacer()
                    }.padding(.top)
                    
                }
                .background(Color(.blue))

                
                List {
                    ForEach(0..<5) { index in
                        HStack {
                            Image(systemName: "flame").foregroundColor(.gray)
                            Text("Item \(index)")
                        }.padding()
                    }
                }
                
                Button(action: {
                    withAnimation(.default) {
                        isView.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            UserStorage.shared.token = ""
                            viewType = .nologin
                        }
                    }
                }, label: {
                    HStack {
                        Text("Logout").padding().foregroundColor(.red)
                    }
                }).frame(width: geometry.size.width)
                
                
            } // end VStack
            .edgesIgnoringSafeArea(.all)
        } // end GeometryReader
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(viewType: .constant(.login), isView: .constant(false))
    }
}
