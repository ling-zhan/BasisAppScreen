//
//  LogoView.swift
//  BasisAppScreen
//
//  Created by Ling on 2021/7/15.
//

import SwiftUI

struct LogoView: View {
    @Binding var size:CGSize
    var body: some View {
        Image("icon")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size.width, height: size.height)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView(size: .constant(CGSize.zero))
    }
}
