//
//  SystemProgressView.swift
//  BasisAppScreen
//
//  Created by Ling on 2021/7/16.
//

import SwiftUI

struct SystemProgressView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                ProgressView()
                Spacer()
            }
            Spacer()
        }
        .background(Color.gray.edgesIgnoringSafeArea(.all).opacity(0.8))
    }
}

struct SystemProgressView_Previews: PreviewProvider {
    static var previews: some View {
        SystemProgressView()
    }
}
