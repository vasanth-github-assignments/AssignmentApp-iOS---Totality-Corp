//
//  ThirdView.swift
//  AssignmentApp
//
//  Created by vasanth on 08/09/23.
//

import SwiftUI

struct ThirdView: View {
    @State var isAnimating = false
    @Namespace var namespace
    
    var body: some View {
        VStack {
            Spacer()
            if isAnimating{
                Text("Ready To Play?")
                    .font(Font.headline)
                    .transition(.scale)
                Text("OSWALD")
                    .font(Font.headline)
                    .transition(.scale)
            }
            
            HStack {
                Rectangle()
                    .frame(width: 80, height: 20)
                    .foregroundColor(Color(UIColor.systemGray4))
                    .cornerRadius(5)
                    .padding(10)
                Rectangle()
                    .frame(width: 50, height: 20)
                    .foregroundColor(Color(UIColor.systemGray4))
                    .cornerRadius(5)
            }
            .transition(.identity)
            
            if isAnimating {
                HStack {
                    Rectangle()
                        .frame(width: 80, height: 60)
                        .foregroundColor(Color(UIColor.systemGray4))
                        .cornerRadius(30)
                    Rectangle()
                        .frame(width: 80, height: 60)
                        .foregroundColor(Color(UIColor.systemGray4))
                        .cornerRadius(30)
                    Rectangle()
                        .frame(width: 80, height: 60)
                        .foregroundColor(Color(UIColor.systemGray4))
                        .cornerRadius(30)
                }
                .transition(.slideFromRight)
            }
                HStack {
                    Text("Wallet Balance:")
                    Rectangle()
                        .frame(width: 50, height: 20)
                        .foregroundColor(Color(UIColor.systemGray4))
                        .cornerRadius(5)
                    Spacer()
                    Rectangle()
                        .frame(width: 40, height: 26)
                        .foregroundColor(Color(UIColor.systemGray4))
                        .cornerRadius(5)
                    Rectangle()
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color(UIColor.systemGray4))
                        .cornerRadius(5)
                }
                .padding([.leading, .trailing, .top], 20)
//                .transition(.scale)
                .matchedGeometryEffect(id: "wallet", in: namespace)
        }
//        .padding()
        .frame(width: UIScreen.main.bounds.width)
        .onAppear {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                isAnimating = true
            }
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
