//
//  AnimationTrailPage.swift
//  AssignmentApp
//
//  Created by Charisma Infotainment on 08/09/23.
//

import SwiftUI

//struct CustomListItem: Identifiable {
//    let id = UUID()
//    let title: String
//    let color: Color
//
//    static let previews: [CustomListItem] = [
//        CustomListItem(title: "Row 1", color: .red),
//        CustomListItem(title: "Row 2", color: .blue),
//        CustomListItem(title: "Row 3", color: .green),
//        CustomListItem(title: "Row 4", color: .orange),
//        CustomListItem(title: "Row 5", color: .pink)
//    ]
//}
//struct AnimationTrailPage: View {
//    var body: some View {
//        ScrollView {
//            ForEach(CustomListItem.previews) { item in
//                item.color
//                    .frame(height: 300)
//                    .overlay {
//                        Text(item.title)
//                    }
//                    .cornerRadius(16)
//                    .padding(.horizontal)
//            }
//        }
//    }
//}

struct AnimationTrailPage: View {
    @Namespace var namespace
    @State var show = false
    
    var body: some View {
        ZStack {
            if !show {
                VStack(alignment: .leading, spacing: 12) {
                    Text("SwiftUI")
                        .font(.largeTitle.weight(.bold))
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("20 section - 3 hours".uppercased())
                        .font(.footnote.weight(.semibold))
                        .matchedGeometryEffect(id: "subTitle", in: namespace)
                    Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
                        .font(.footnote)
                        .matchedGeometryEffect(id: "text", in: namespace)
                }
                .padding(20)
                .foregroundColor(.white)
                .background {
                    Color.red
                        .matchedGeometryEffect(id: "background", in: namespace)
                }
                .padding(20)
            } else {
                VStack(alignment: .leading, spacing: 12) {
                    Spacer()
                    Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
                        .font(.footnote)
                        .matchedGeometryEffect(id: "text", in: namespace)
                    Text("20 section - 3 hours".uppercased())
                        .font(.footnote.weight(.semibold))
                        .matchedGeometryEffect(id: "subTitle", in: namespace)
                    Text("SwiftUI")
                        .font(.largeTitle.weight(.bold))
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .foregroundColor(.black)
                .background {
                    Color.blue
                        .matchedGeometryEffect(id: "background", in: namespace)
                }
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                show.toggle()
            }
        }
    }
}
struct AnimationTrailPage_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTrailPage()
    }
}
