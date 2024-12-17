//
//  DetailView.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 19/11/2024.
//

import Foundation
import SwiftUI

@available(macOS 12.0, *)
struct DetailView: View {
    let categoryName: String // Name of the category
    let imageName: String    // Name of the image passed from HomeScreenView
    var onBack: () -> Void

    @State private var showSavePopup = false
    @State private var selectedMockup: String = "T-Shirt"
    @State private var loadedImage: NSImage? = nil
    @State private var imageLoadError: String? = nil
    @State private var showUpgradePopup = false  // State to control popup visibility

    var body: some View {
        VStack(spacing: 16) {
            // Navigation Bar
            HStack {
                Button(action: {
                    onBack() // Handle back action
                }) {
                    HStack {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 16, height: 16)
                            .foregroundColor(.black)
                        Text("Back")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                }
                .buttonStyle(.plain)
                .padding(.leading)
                Spacer()
                Text("Customise or Save")
                    .font(.title2)
                    .foregroundColor(.accentColor)
                Spacer()
            }
            .padding()

            // Main Content
            HStack(alignment: .top, spacing: 16) {
                // Original View Panel
                VStack(spacing: 0.1) {
                    Text("Original View")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 0, style: .continuous)
                                .fill(Color.accentColor)
                                .clipShape(RoundedRectangle(cornerRadius: 0, style: .continuous))
                        )
                        .frame(width: 120, height: 20, alignment: .center)
                        .mask(
                            RoundedCornersShape(topLeft: 10, topRight: 10, bottomLeft: 0, bottomRight: 0)
                        )
                        .overlay(
                            RoundedCornersShape(topLeft: 10, topRight: 10, bottomLeft: 0, bottomRight: 0)
                                .stroke(Color.accentColor, lineWidth: 2)
                        )
                    
                    Rectangle()
                        .stroke(Color.accentColor, lineWidth: 2)
                        .overlay(
                            RoundedCornersShape(topLeft: 10, topRight: 10, bottomLeft: 0, bottomRight: 0)
                                .stroke(Color.accentColor, lineWidth: 2)
                        )
                        .overlay(
                            Group {
                                if let loadedImage = loadedImage {
                                    Image(nsImage: loadedImage) // Display the loaded image
                                        .resizable()
                                        .scaledToFit()
                                        .padding()
                                } else if let _ = imageLoadError {
//                                    Text(error)  // Display error message if image fails to load
                                    Image(systemName: "photo") // Display the loaded image
                                        .resizable()
                                        .scaledToFit()
                                        .padding()
                                        .foregroundColor(.accentColor)
                                } else {
                                    ProgressView()  // Show a loading indicator while the image loads
                                }
                            }
                        )
                        .background(Color.white)
                        .cornerRadius(3)
                }
                .frame(width: 300, height: 500)


                // MockUp View
                VStack(spacing: 0.1) {
                    Text("MockUp View")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.accentColor)
                        .background(
                            RoundedRectangle(cornerRadius: 0, style: .continuous)
                                .fill(Color.accentColor)
                                .clipShape(RoundedRectangle(cornerRadius: 0, style: .continuous))
                        )
                        .frame(width: 120, height: 20, alignment: .center)
                        .mask(
                            RoundedCornersShape(topLeft: 10, topRight: 10, bottomLeft: 0, bottomRight: 0)
                        )
                        .overlay(
                            RoundedCornersShape(topLeft: 10, topRight: 10, bottomLeft: 0, bottomRight: 0)
                                .stroke(Color.accentColor, lineWidth: 2)
                        )
                    
                    Rectangle()
                        .stroke(Color.accentColor, lineWidth: 2)
                        .overlay(
                            ZStack {
                                if selectedMockup == "T-Shirt" {
                                    GeometryReader { geometry in
                                        Image("mockupshirt")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geometry.size.width, height: geometry.size.height)
                                            .overlay(
                                                Group {
                                                    if let loadedImage = loadedImage {
                                                        Image(nsImage: loadedImage) // Display the loaded image
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.3) // Reduce the size to 30%
                                                            .position(x: geometry.size.width / 2 - 20, y: geometry.size.height / 2 - 40) // Move the image left and up
                                                            .padding()
                                                    } else if let _ = imageLoadError {
                                                        // Show a fallback image or error message
                                                        Image(systemName: "photo")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.3)
                                                            .position(x: geometry.size.width / 2 - 20, y: geometry.size.height / 2 - 40) // Same position adjustments
                                                            .padding()
                                                            .foregroundColor(.accentColor)
                                                    } else {
                                                        ProgressView()  // Show a loading indicator while the image loads
                                                            .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.3)
                                                            .position(x: geometry.size.width / 2 - 20, y: geometry.size.height / 2 - 40) // Same position adjustments
                                                    }
                                                }
                                            )
                                    }
                                }
                                else if selectedMockup == "Cup" {
                                    GeometryReader { geometry in
                                        Image("mockupCup")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geometry.size.width, height: geometry.size.height)
                                            .overlay(
                                                Group {
                                                    if let loadedImage = loadedImage {
                                                        Image(nsImage: loadedImage) // Display the loaded image
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.3) // Reduce the size to 30%
                                                            .position(x: geometry.size.width / 2 - 20, y: geometry.size.height / 2 - 40) // Move the image left and up
                                                            .padding()
                                                    } else if let _ = imageLoadError {
                                                        // Show a fallback image or error message
                                                        Image(systemName: "photo")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.3)
                                                            .position(x: geometry.size.width / 2 - 20, y: geometry.size.height / 2 - 40) // Same position adjustments
                                                            .padding()
                                                            .foregroundColor(.accentColor)
                                                    } else {
                                                        ProgressView()  // Show a loading indicator while the image loads
                                                            .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.3)
                                                            .position(x: geometry.size.width / 2 - 20, y: geometry.size.height / 2 - 40) // Same position adjustments
                                                    }
                                                }
                                            )
                                    }
                                }
                                else if selectedMockup == "Cap" {
                                    GeometryReader { geometry in
                                        Image("mockupCap")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geometry.size.width, height: geometry.size.height)
                                            .overlay(
                                                Group {
                                                    if let loadedImage = loadedImage {
                                                        Image(nsImage: loadedImage) // Display the loaded image
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.3) // Reduce the size to 30%
                                                            .position(x: geometry.size.width / 2 - 20, y: geometry.size.height / 2 - 40) // Move the image left and up
                                                            .padding()
                                                    } else if let _ = imageLoadError {
                                                        // Show a fallback image or error message
                                                        Image(systemName: "photo")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.3)
                                                            .position(x: geometry.size.width / 2 - 20, y: geometry.size.height / 2 - 40) // Same position adjustments
                                                            .padding()
                                                            .foregroundColor(.accentColor)
                                                    } else {
                                                        ProgressView()  // Show a loading indicator while the image loads
                                                            .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.3)
                                                            .position(x: geometry.size.width / 2 - 20, y: geometry.size.height / 2 - 40) // Same position adjustments
                                                    }
                                                }
                                            )
                                    }
                                }
                            }
                        )
                        .background(Color.white)
                        .cornerRadius(3)
                }
                .frame(width: 300, height: 500)

                // Mockup Options
                VStack(spacing: 20) {
                    Text("Mockup Options:")
                        .font(.headline)
                        .foregroundColor(.accentColor)

                    VStack(spacing: 24) {
                        // T-Shirt Button
                        Button(action: {
                            selectedMockup = "T-Shirt" // Switch to T-Shirt mockup
                        }) {
                            VStack {
                                Text("T-Shirt")
                                    .font(.body)
                                    .foregroundColor(.accentColor)
                                    .padding(.bottom, 20)
                                Image("mockupshirt")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 50)
                            }
                            .frame(width: 120, height: 120)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(selectedMockup == "T-Shirt" ? Color.accentColor : Color.accentColor, lineWidth: 2)
                            )
                        }
                        .buttonStyle(.plain)

                        // Cup Button
                        Button(action: {
                            selectedMockup = "Cup" // Switch to Cup mockup
                        }) {
                            VStack {
                                Text("Cup")
                                    .font(.body)
                                    .foregroundColor(.accentColor)
                                    .padding(.bottom, 10)
                                Image("mockupCup")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 50)
                            }
                            .frame(width: 120, height: 120)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(selectedMockup == "Cup" ? Color.accentColor : Color.accentColor, lineWidth: 2)
                            )
                        }
                        .buttonStyle(.plain)

                        // Cap Button
                        Button(action: {
                            selectedMockup = "Cap" // Switch to Cap mockup
                        }) {
                            VStack {
                                Text("Cap")
                                    .font(.body)
                                    .foregroundColor(.accentColor)
                                    .padding(.bottom, 10)
                                Image("mockupCap")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 50)
                            }
                            .frame(width: 120, height: 120)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(selectedMockup == "Cap" ? Color.accentColor : Color.accentColor, lineWidth: 2)
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
                .frame(width: 150)
            }
            .padding()

            // Save Button
            Button(action: {
                showSavePopup = true
            }) {
                Text("Save")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(Color.accentColor)
                    .cornerRadius(30)
            }
            .buttonStyle(.plain)
            .padding()
//            // SavePopupView
//                       if showSavePopup {
//                           SavePopupView(showSavePopup: $showSavePopup, loadedImage: $loadedImage, showUpgradePopup: $showUpgradePopup)
//                               .zIndex(1)
//                               .transition(.opacity)
//                       }
//
//                       // ProUpgradePopup
//                       if showUpgradePopup {
//                           ProUpgradePopup(isPresented: $showUpgradePopup, mockupImage: "proImages")
//                               .zIndex(2)
//                               .transition(.opacity)
//                       }
        }
        .background(Color.white)
        .padding()
//        .animation(.easeInOut, value: showSavePopup || showUpgradePopup)
        .sheet(isPresented: $showSavePopup) {
            SavePopupView(showSavePopup: $showSavePopup, loadedImage: $loadedImage, showUpgradePopup: $showUpgradePopup)
        }
        .sheet(isPresented: $showUpgradePopup) {
            ProUpgradePopup(isPresented: $showUpgradePopup, mockupImage: "proImages")
        }
        .onAppear {
                 fetchImage(from: imageName) // Trigger image fetching when view appears
             }


    }
    
    func fetchImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            imageLoadError = "Invalid URL"
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    imageLoadError = "Error fetching image: \(error.localizedDescription)"
                    print("Error fetching image: \(error.localizedDescription)") // Debugging log
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                // Check if response status code is 200 (OK)
                if httpResponse.statusCode != 200 {
                    DispatchQueue.main.async {
                        imageLoadError = "Failed to fetch image. Status code: \(httpResponse.statusCode)"
                        print("Failed to fetch image. Status code: \(httpResponse.statusCode)") // Debugging log
                    }
                    return
                }
            }
            
            if let data = data, let nsImage = NSImage(data: data) {
                DispatchQueue.main.async {
                    loadedImage = nsImage
                    imageLoadError = nil
                }
            } else {
                DispatchQueue.main.async {
                    imageLoadError = "Failed to load image data."
                    print("Failed to load image data.") // Debugging log
                }
            }
        }
        
        task.resume()
    }

}

 
@available(macOS 12.0, *)
struct SavePopupView: View {
        @Binding var showSavePopup: Bool // Control popup visibility
        @Binding var loadedImage: NSImage? // Access the loaded image
        @State private var showAlert: Bool = false // State for showing an alert
        @State private var alertMessage: String = ""
        @Binding var showUpgradePopup: Bool // New state for Upgrade popup
        @State private var isPremiumUser: Bool = false
    
    var body: some View {
        ZStack {
            // Dim background
//            Color.gray.opacity(0.5)
//                .ignoresSafeArea()
            // Main popup container
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    // Left panel (image preview)
                    ZStack {
                        Color.white
                        if let image = loadedImage {
                            Image(nsImage: image)
                                .resizable()
                                .scaledToFit()
                                .padding()
                        } else {
                            Text("No Image Loaded")
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(width: 350, height: 400)
                    
                    // Right panel (options)
                    ZStack {
                        Color.accentColor
                        VStack(spacing: 20) {
                            // Header
                            VStack(spacing: 8) {
                                Image("designlogo") // Replace with custom illustration
                                    .resizable()
                                    .frame(width: 200, height: 100)
                                    .foregroundColor(.white)
                            }

                            // Buttons
                            VStack(spacing: 16) {
                                // Reusable Button
                                CustomButton(title: "SVG File", backgroundColor: Color.buttonGreen, textColor: .white) {
                                    if let image = loadedImage {
                                        saveSVG(from: image)
                                    }
                                }

                                CustomButton(title: "High Resolution PNG", backgroundColor: .white, textColor: .black, isPro: true) {
//                                    showProFeatureAlert(message: "Upgrade to Pro for High-Resolution PNG.")
                                    if isPremiumUser {
                                        // Handle high-resolution file action
                                        
                                    }
                                    else {
                                        showSavePopup = false // Hide SavePopupView
                                        showUpgradePopup = true // Show ProUpgradePopup
                                    }
                                }

                                CustomButton(title: "PDF File", backgroundColor: .white, textColor: .black, isPro: true) {
//                                    showProFeatureAlert(message: "Upgrade to Pro for PDF File.")
                                    if isPremiumUser {
                                        // Handle high-resolution file action
                                        
                                    }
                                    else {
                                        showSavePopup = false // Hide SavePopupView
                                        showUpgradePopup = true // Show ProUpgradePopup
                                    }
                                }

                                CustomButton(title: "Cancel", backgroundColor: .white, textColor: .black) {
                                    showSavePopup = false
                                }
                            }
                        }
                        .padding()
                    }
                    .frame(width: 350, height: 400)
                }
            }
            .background(Color.clear)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blue, lineWidth: 2)
            )
        }
        .frame(width: 700, height: 400)
    }
    private func saveSVG(from image: NSImage) {
        let savePanel = NSSavePanel()
        savePanel.allowedFileTypes = ["svg"]
        
        let baseName = "Image"
        savePanel.nameFieldStringValue = "\(baseName).svg"

        savePanel.begin { result in
            if result == .OK, let url = savePanel.url {
                let svgData = convertImageToVectorSVG(image: image) // Generate vector-based SVG
                do {
                    try svgData.write(to: url) // Save the SVG data to the file
                    print("SVG saved successfully at \(url.path)")
                } catch {
                    print("Failed to save SVG: \(error.localizedDescription)")
                }
            }
        }
    }
    private func convertImageToVectorSVG(image: NSImage) -> Data {
        guard let bitmapRep = image.representations.first as? NSBitmapImageRep else {
            print("Failed to get bitmap representation of the image.")
            return Data()
        }

        let width = bitmapRep.pixelsWide
        let height = bitmapRep.pixelsHigh

        // Start building the SVG content
        var svgContent = """
        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 \(width) \(height)">
        """

        // Draw image as a vector using <image> tag and base64 encoding
        if let imageData = bitmapRep.representation(using: .png, properties: [:]) {
            let base64Image = imageData.base64EncodedString()
            svgContent += """
            <image x="0" y="0" width="\(width)" height="\(height)" xlink:href="data:image/png;base64,\(base64Image)" />
            """
        }

        // Close the SVG
        svgContent += "</svg>"

        return svgContent.data(using: .utf8) ?? Data()
    }

//    private func saveSVG(from image: NSImage) {
//            let savePanel = NSSavePanel()
//            savePanel.allowedFileTypes = ["svg"]
//            savePanel.nameFieldStringValue = "Image.svg"
//
//            savePanel.begin { result in
//                if result == .OK, let url = savePanel.url {
//                    let svgData = convertImageToSVG(image: image) // Call the function here
//                    do {
//                        try svgData.write(to: url) // Write the SVG data to the URL
//                        print("SVG saved successfully at \(url.path)")
//                    } catch {
//                        print("Failed to save SVG: \(error.localizedDescription)")
//                    }
//                }
//            }
//        }
//    private func convertImageToSVG(image: NSImage) -> Data {
//        // Get the bitmap representation of the image
//        guard let bitmapRep = image.representations.first as? NSBitmapImageRep else {
//            print("Failed to get bitmap representation of the image.")
//            return Data()
//        }
//
//        let width = bitmapRep.pixelsWide
//        let height = bitmapRep.pixelsHigh
//
//        // Start building the SVG content
//        var svgContent = """
//        <svg width="\(width)" height="\(height)" xmlns="http://www.w3.org/2000/svg">
//        """
//
//        // Loop through each pixel and create a <rect> for it
//        for y in 0..<height {
//            for x in 0..<width {
//                if let color = bitmapRep.colorAt(x: x, y: y) {
//                    let red = Int(color.redComponent * 255)
//                    let green = Int(color.greenComponent * 255)
//                    let blue = Int(color.blueComponent * 255)
//                    let alpha = color.alphaComponent // Optional transparency handling
//
//                    // Only add colored pixels (ignore fully transparent ones)
//                    if alpha > 0 {
//                        svgContent += """
//                        <rect x="\(x)" y="\(y)" width="1" height="1" fill="rgb(\(red),\(green),\(blue))" />
//                        """
//                    }
//                }
//            }
//        }
//
//        // Close the SVG
//        svgContent += "</svg>"
//
//        // Convert to Data
//        return svgContent.data(using: .utf8) ?? Data()
//    }


    private func showProFeatureAlert(message: String) {
        alertMessage = message
        showAlert = true
    }
}

@available(macOS 12.0, *)
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(categoryName: "", imageName: "", onBack: {})
    }
}



struct RoundedCornersShape: Shape {
    var topLeft: CGFloat = 0
    var topRight: CGFloat = 0
    var bottomLeft: CGFloat = 0
    var bottomRight: CGFloat = 0

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let width = rect.size.width
        let height = rect.size.height

        let topLeftRadius = min(min(topLeft, height / 2), width / 2)
        let topRightRadius = min(min(topRight, height / 2), width / 2)
        let bottomLeftRadius = min(min(bottomLeft, height / 2), width / 2)
        let bottomRightRadius = min(min(bottomRight, height / 2), width / 2)

        path.move(to: CGPoint(x: width / 2, y: 0))
        path.addLine(to: CGPoint(x: width - topRightRadius, y: 0))
        path.addArc(
            center: CGPoint(x: width - topRightRadius, y: topRightRadius),
            radius: topRightRadius,
            startAngle: Angle(degrees: -90),
            endAngle: Angle(degrees: 0),
            clockwise: false
        )

        path.addLine(to: CGPoint(x: width, y: height - bottomRightRadius))
        path.addArc(
            center: CGPoint(x: width - bottomRightRadius, y: height - bottomRightRadius),
            radius: bottomRightRadius,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 90),
            clockwise: false
        )

        path.addLine(to: CGPoint(x: bottomLeftRadius, y: height))
        path.addArc(
            center: CGPoint(x: bottomLeftRadius, y: height - bottomLeftRadius),
            radius: bottomLeftRadius,
            startAngle: Angle(degrees: 90),
            endAngle: Angle(degrees: 180),
            clockwise: false
        )

        path.addLine(to: CGPoint(x: 0, y: topLeftRadius))
        path.addArc(
            center: CGPoint(x: topLeftRadius, y: topLeftRadius),
            radius: topLeftRadius,
            startAngle: Angle(degrees: 180),
            endAngle: Angle(degrees: 270),
            clockwise: false
        )

        path.closeSubpath()

        return path
    }
}
