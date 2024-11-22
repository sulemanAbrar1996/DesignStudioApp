//
//  LoadingScreenView.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 17/11/2024.
//

import SwiftUI


@available(macOS 13.0, *)
struct LoadingScreenView: View {
    @State private var isLoaded = false
    @State private var angle = Angle.degrees(0)
    @State private var progress: Double = 0.0
    var body: some View {
         ZStack {
             if !isLoaded {
                 VStack {
                     Image("designlogo") // Replace with your logo image name
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(width: 150, height: 150) // Adjust the size as needed
                         .padding()

                     DottedCircle()
                         .frame(width: 50, height: 50)
                         .foregroundColor(.white)

                     Text("Loading...")
                         .font(.headline)
                         .foregroundColor(.white)
                     ProgressBar(progress: progress)
                         .frame(maxWidth: .infinity, maxHeight: 10)
                         .foregroundColor(.white)
                         .background(Color.gray.opacity(0.3))
                         .cornerRadius(20)
                         
                 }
                 .frame(maxWidth: .infinity, maxHeight: .infinity)
                 .background(Color.accentColor)
                 .onAppear {
                     withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                         angle = .degrees(360)
                         progress = 1.0
                     }
                     
                     DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                         withAnimation {
                             isLoaded = true
                         }
                     }
                 }
             } else {
                 // Your home screen view
                 HomeScreenView()
             }
         }
     }
}

@available(macOS 13.0, *)
struct LoadingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreenView()
    }
}

struct DottedCircle: Shape {
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 3
        
        var path = Path()

        
        let dashLength = 3.0
        let dashOffset = 20.0
        
        path.addArc(center: center, radius: radius, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: false)
        
        return path.strokedPath(StrokeStyle(lineWidth:
 2, lineCap: .round, lineJoin: .round, dash: [dashLength], dashPhase: dashOffset))
    }
}
struct ProgressBar: Shape {
    var progress: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        
        let progressWidth = width * progress
        
        path.addRect(CGRect(x: 0, y: 0, width: progressWidth, height: height))
        
        return path
    }
}
