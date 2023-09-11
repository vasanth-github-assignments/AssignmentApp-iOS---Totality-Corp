//
//  FirstView.swift
//  AssignmentApp
//
//  Created by vasanth on 08/09/23.
//

import SwiftUI

struct FirstView: View {
    @State var isAnimating = false
    
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
            HStack(spacing: 20) {
                if isAnimating {
                    UserItem()
                        .transition(.slideFromRight) // Use custom transition modifier
                    UserItem()
                        .transition(.slideFromRight) // Use custom transition modifier
                }
            }
            .frame(width: UIScreen.main.bounds.width)
            Spacer()
        }
        .onAppear {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 2)) {
                isAnimating = true
            }
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
