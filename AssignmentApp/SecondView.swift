//
//  SecondView.swift
//  AssignmentApp
//
//  Created by vasanth on 08/09/23.
//

import SwiftUI

struct SecondView: View {
    @State var isAnimating = false
    @Namespace var namespace
    
    var body: some View {
        VStack {
            Spacer()
            if isAnimating {
                Rectangle()
                    .frame(width: 150, height: 30)
                    .foregroundColor(Color(UIColor.systemGray4))
                    .cornerRadius(5)
                    .padding(10)
                    .transition(.scale)
            }
            Rectangle()
                .frame(width: 120, height: 20)
                .foregroundColor(Color(UIColor.systemGray4))
                .cornerRadius(5)
                .padding(10)
                .transition(.identity)
            if isAnimating {
                HStack(spacing: 20) {
                    NumberItem(number: 5, color: Color("appGreen"))
                    NumberItem(number: 10, color: Color(UIColor.systemGray4))
                    NumberItem(number: 20, color: Color(UIColor.systemGray4))
                }
                .transition(.slideFromRight)
            }
            if isAnimating {
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
                .matchedGeometryEffect(id: "wallet", in: namespace)
                .transition(.scale)
            }
        }
        .frame(width: UIScreen.main.bounds.width)
//        .padding(30)
        .onAppear {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                isAnimating = true
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
