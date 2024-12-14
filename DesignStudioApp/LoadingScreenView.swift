//
//  LoadingScreenView.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 17/11/2024.
//

import SwiftUI


@available(macOS 12.0, *)
struct LoadingScreenView: View {
    @State private var isLoaded = false
    @State private var progress: Double = 0.0

    var body: some View {
        ZStack {
            if !isLoaded {
                VStack(spacing: 20) {
                    Image("designlogo") // Replace with your actual logo image name
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200) // Adjusted size
                        .padding(.bottom, 10)


                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(1)

                    Text("LOADING...")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)

                    ProgressBar(progress: progress)
                        .frame(maxWidth: 600, maxHeight: 15)
                        
                        .padding(.horizontal, 40)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.accent) // Background matches your image's green
                .ignoresSafeArea()
                .onAppear {
                    // Simulate progress loading
                    withAnimation(.linear(duration: 3)) {
                        progress = 1.0
                    }

                    // Transition to HomeScreenView after the loading completes
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            isLoaded = true
                        }
                    }
                }
            } else {
                // Transition to your home screen view
                HomeScreenView()
            }
        }
    }
}

@available(macOS 12.0, *)
struct LoadingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreenView()
    }
}

// MARK: - Custom ProgressBar

struct ProgressBar: View {
    var progress: Double

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.buttonGreen) // Background track
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white) // Progress bar fill
                    .frame(width: geometry.size.width * CGFloat(progress))
                    .overlay(
                     RoundedRectangle(cornerRadius: 8)
                        .stroke(.buttonGreen, lineWidth: 1)
                    )
            }
        }
    }
}


