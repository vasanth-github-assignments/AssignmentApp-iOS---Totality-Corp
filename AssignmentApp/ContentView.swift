//
//  ContentView.swift
//  AssignmentApp
//
//  Created by vasanth on 07/09/23.
//

import SwiftUI

struct ContentView: View {
   @State private var isGamePagePresented = false
   
   var body: some View {
       NavigationView {
           ScrollView {
               Text("PLAY")
               VStack {
                   ForEach(1...5, id: \.self) { _ in
                       Button(action: {
                           isGamePagePresented.toggle()
                       }) {
                           ItemView()
                       }
                   }
                   .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
               }
           }
           .scrollIndicators(.hidden)
           .sheet(isPresented: $isGamePagePresented) {
               NavigationView {
                   GamePage(closeAction: {
                       isGamePagePresented.toggle()
                   })
               }
           }
       }
   }
}

struct ItemView: View {
    
    var body: some View {
        ZStack() {
            Rectangle()
                .frame(width: 340, height: 500)
                .foregroundColor(.orange)
                .cornerRadius(30)
            VStack(alignment: .center) {
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color("appYellow"))
                    .cornerRadius(12)
                    .offset(x: -100, y: -130)
                Rectangle()
                    .frame(width: 310, height: 70)
                    .foregroundColor(Color("appGreen"))
                    .cornerRadius(45)
                    .offset(x: 0, y: 140)
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
