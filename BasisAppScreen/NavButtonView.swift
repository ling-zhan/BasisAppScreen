//
//  NavButtonView.swift
//  BasisAppScreen
//
//  Created by Ling on 2021/7/16.
//

import SwiftUI

struct NavButtonView: View {
    @Binding var isMenu: Bool
    var body: some View {
        // 導覽列
        HStack(spacing: 10) {
            
            Button(action: {
                // menu
                isMenu.toggle()
            }, label: {
                Image(systemName: "line.horizontal.3")
                    .foregroundColor(Color("TitleColor"))
                    .font(.title3)
            })
            
            Image("userCover")
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.all,2)
                .background(Color.white)
                .clipShape(Circle())
        }
    }
}

struct NavButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NavButtonView(isMenu: .constant(true))
    }
}
