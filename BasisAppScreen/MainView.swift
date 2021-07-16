//
//  MainView.swift
//  BasisAppScreen
//
//  Created by Ling on 2021/7/15.
//

import SwiftUI

struct MainView: View {
    @Binding var isProgress: Bool
    
    var body: some View {
        ScrollView {
            ForEach(0..<10) { index in
                HStack {
                    VStack(spacing: 5) {
                        Text("Car news")
                            .font(.title3).bold()
                            .foregroundColor(Color("TitleColor"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("The car has an 8.4 percent share of the market in Vietnam but said it will need to raise additional funds to finance its global expansion.")
                            .font(.body)
                            .foregroundColor(.gray)
                            .lineLimit(5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                    }
                    
                    Spacer()
                    VStack {
                        Image("photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .cornerRadius(12)
                        
                    }
                }
                .padding(.all, 10)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color("CardFgColor"))
                .cornerRadius(12)
                .padding(.horizontal)
                .shadow(color: Color("CardBgColor"), radius: 10)
                .padding(.top, 20)
                .onTapGesture(perform: {
                    isProgress.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        isProgress.toggle()
                    }
                })
            } // ForEach
        } // end ScrollView
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(isProgress: .constant(false))
    }
}
