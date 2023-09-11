//
//  GamePage.swift
//  AssignmentApp
//
//  Created by vasanth on 07/09/23.
//

import SwiftUI

struct GamePage: View {
    var closeAction: () -> Void // Action to dismiss the view
    @State private var downloadProgress: CGFloat = 0 // Track download progress
    @State private var isDownloading = false // Track if download is in progress
    @State private var showPlayButton = false // Track whether to show the play button
    @State var isShowingBottomSheet = false
    @State var isAnimating = false
    @Namespace var namespace
    var body: some View {
        ZStack {
            VStack(spacing: 8) {
                HStack(alignment: .top) {
                    HStack(alignment: .top) {
                        Rectangle() // Game Icon
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color("appYellow"))
                            .cornerRadius(12)
                            
                        Text("CANDY\nBUST")
                            .padding(.leading, 10)
                            .multilineTextAlignment(.leading)
                            .tracking(1)
                            .font(.system(.title2))
                            .fontWeight(.regular)
                            .offset(y: 8)
                    }
                    Spacer()
                    
                    Button(action: {
                        closeAction() // Call the close action to dismiss the view
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    }
                }
                .padding()
                
                Text("What is Lorem Ipsum? Lorem is simply dummy text of the printing and typesetting")
                    .tracking(0.5)
                    .padding(8)
                
                Button {
                    
                } label: {
                    Text("READ MORE")
                        .tracking(1)
                        .foregroundColor(.green)
                }
                .padding()
                
                if isAnimating {
                    ScrollView(.horizontal) {
                        HStack{
                            ForEach(1...5, id: \.self) { _ in
                                Rectangle()
                                    .frame(width: 300)
                                    .foregroundColor(.gray)
                                
                            }
                        }
                    }
                    .transition(.slideFromRight)
                }
                
                Spacer()
                if !isDownloading && showPlayButton {
                    Button(action: {
                        withAnimation{
                            isShowingBottomSheet.toggle()
                        }
                    }) {
                        ZStack {
                            Rectangle()
                                .frame(width: 350, height: 70)
                                .foregroundColor(.blue)
                                .opacity(0.6)
                                .cornerRadius(50)
                            Text("PLAY")
                                .foregroundColor(.white)
                        }
                    }
                    .transition(.slideFromBottom)
                } else {
                    Button {
//                        withAnimation{
//                            isShowingBottomSheet.toggle() // Bottom Sheet Showing
//                        }
                        if isDownloading {
                            stopDownload()
                        } else {
                            startDownload()
                        }
                        
                    } label: {
                        ZStack {
                            if isDownloading {
                                HStack(spacing: 5) {
                                    ZStack(alignment: .leading) {
                                        Rectangle()
                                            .frame(width: 350, height: 70)
                                            .foregroundColor(Color("appGreen"))
                                            .cornerRadius(50)
                                            .matchedGeometryEffect(id: "downloadButton", in: namespace)
                                            .opacity(0.6)
                                        Rectangle()
                                            .frame(width: 350 * downloadProgress, height: 70)
                                            .foregroundColor(Color("appGreen"))
                                            .cornerRadius(50)
                                            .transition(.opacity)
                                    }
                                    Image(systemName: "xmark.circle.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(.yellow)
                                        .transition(.opacity)
                                }
                            }
                            
                            
                            if !isDownloading {
                                Rectangle()
                                    .frame(width: 350, height: 70)
                                    .foregroundColor(Color("appGreen"))
                                    .cornerRadius(50)
                                    .matchedGeometryEffect(id: "downloadButton", in: namespace)
                            }
                            
                            VStack {
                                if !isDownloading {
                                    Text("DOWNLOAD")
                                        .foregroundColor(.white)
                                        .tracking(1)
                                    Text("30 MB")
                                        .foregroundColor(.white)
                                        .tracking(1)
                                }
                                else {
                                    Text("10 MB / 30 MB")
                                        .foregroundColor(.white)
                                        .transition(.opacity)
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            .onAppear {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 2)) {
                    isAnimating = true
                }
            }
            
            BottomSheet(isShowing: $isShowingBottomSheet, content: BottomSheetType.game.view())
        }
    }
    
    private func startDownload() {
        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
            isDownloading = true
        }
        
        // Simulate download progress with a Timer
        let timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            // Update the progress by 10% per second until it reaches 100%
            if downloadProgress < 1.0 {
                downloadProgress += 0.1
            } else {
                // Download is complete
                timer.invalidate()
                isDownloading = false
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    showPlayButton = true // Show the "Play" button
                }
            }
        }
        RunLoop.main.add(timer, forMode: .common)
    }
    
    private func stopDownload() {
        withAnimation(.spring(response: 0.6, dampingFraction: 0.8))   {
            isDownloading = false
        }
        downloadProgress = 0.0
    }
}


struct GamePage_Previews: PreviewProvider {
    static var previews: some View {
        GamePage{
            
        }
    }
}
