//
//  BottomSheetView.swift
//  AssignmentApp
//
//  Created by vasanth on 08/09/23.
//

import SwiftUI

enum BottomSheetType: Int {
    case game
    
    func view() -> AnyView {
        switch self {
        case .game:
            return AnyView(GameBottomSheet())
        }
    }
}

struct BottomSheet: View {
    
    @Binding var isShowing: Bool
    var content: AnyView
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if (isShowing) {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                content
                    .padding(.bottom, 42)
                    .transition(.move(edge: .bottom))
                    .background(
                        Color(uiColor: .white)
                    )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
    }
}

struct BottomSheetView: View {
    @Binding var isShowing: Bool
    var content: AnyView
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if (isShowing) {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                content
                    .padding(.bottom, 42)
                    .transition(.move(edge: .bottom))
                    .background(
                        Color(uiColor: .white)
                    )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
}

enum ContentViewState {
    case firstView
    case secondView
    case thirdView
}

struct GameBottomSheet: View {
    @State private var currentViewState: ContentViewState = .firstView
    
    var body: some View {
        VStack {
            VStack {
                switch currentViewState {
                case .firstView:
                    FirstView()
                case .secondView:
                    SecondView()
                case .thirdView:
                    ThirdView()
                }
            }
            .frame(height: UIScreen.main.bounds.height / 3.5)
            
            if currentViewState == .thirdView {
                Button(action: {
                    // Handle the action for the "PLAY" button
                }) {
                    ZStack {
                        Rectangle()
                            .frame(width: 350, height: 70)
                            .foregroundColor(.blue) // Blue color for "PLAY"
                            .cornerRadius(50)
                        Text("PLAY")
                            .foregroundColor(.white)
                            .tracking(1)
                    }
                    .frame(height: UIScreen.main.bounds.height / 9.5)
                }
            } else {
                Button(action: {
                    // Transition to the next view in sequence
                    switch currentViewState {
                    case .firstView:
                        currentViewState = .secondView
                    case .secondView:
                        currentViewState = .thirdView
                    case .thirdView:
                        currentViewState = .firstView
                    }
                }) {
                    ZStack {
                        Rectangle()
                            .frame(width: 350, height: 70)
                            .foregroundColor(Color("appGreen"))
                            .cornerRadius(50)
                        Text("NEXT")
                            .foregroundColor(.white)
                            .tracking(1)
                    }
                }
                .frame(height: UIScreen.main.bounds.height / 9.5)
            }
        }
    }
}

struct NumberItem: View {
    var number: Int
    var color: Color
    var body: some View {
        ZStack {
            Circle()
                .frame(height: 60)
                .foregroundColor(color)
            Text("\(number)")
                .foregroundColor(.white)
        }
    }
    
}

struct UserItem: View {
    var body: some View {
        VStack(spacing: 10) {
            Circle()
                .frame(height: 80)
                .foregroundColor(Color(UIColor.systemGray4))
            Rectangle()
                .frame(width: 130, height: 20)
                .foregroundColor(Color(UIColor.systemGray4))
                .cornerRadius(5)
            Rectangle()
                .frame(width: 90, height: 20)
                .foregroundColor(Color(UIColor.systemGray4))
                .cornerRadius(5)
        }
    }
}

extension AnyTransition {
    static var slideFromRight: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing).combined(with: .opacity)
        let removal = AnyTransition.move(edge: .trailing).combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    static var slideFromBottom: AnyTransition {
            let insertion = AnyTransition.move(edge: .bottom).combined(with: .opacity)
            let removal = AnyTransition.move(edge: .bottom).combined(with: .opacity)
            return .asymmetric(insertion: insertion, removal: removal)
        }
}
