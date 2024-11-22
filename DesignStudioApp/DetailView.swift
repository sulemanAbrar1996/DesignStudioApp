//
//  DetailView.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 19/11/2024.
//

import Foundation
import SwiftUI

struct DetailView: View {
    let categoryName: String // Name of the category
    let imageName: String    // Name of the image passed from HomeScreenView
    @State private var showSavePopup = false
    
    var body: some View {
        VStack(spacing: 16) {
            // Navigation Bar
            HStack {
                Button(action: {
                    // Handle back action (handled automatically by NavigationLink)
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
                .padding(.leading)
                Spacer()
                Text("Customize or Save")
                    .font(.title2)
                    .foregroundColor(.green)
                Spacer()
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
                                .fill(Color.green)
                        )
                        .frame(width: 120, height: 20, alignment: .center)
                        .mask(
                            RoundedCornersShape(topLeft: 10, topRight: 10, bottomLeft: 0, bottomRight: 0)
                        )
                        .overlay(
                            RoundedCornersShape(topLeft: 10, topRight: 10, bottomLeft: 0, bottomRight: 0)
                                .stroke(Color.green, lineWidth: 2)
                        )

                    // Rectangle with green border containing the image
                    Rectangle()
                        .stroke(Color.green, lineWidth: 2)
                        .overlay(
                            Image(imageName) // Use the dynamic imageName passed from HomeScreenView
                                .resizable()
                                .scaledToFit()
                                .padding()
                        )
                        .background(Color.white)
                        .cornerRadius(3)
                }
                .frame(width: 300, height: 500)

                // Mockup Options
                VStack(spacing: 20) {
                    Text("Mockup Options:")
                        .font(.headline)
                        .foregroundColor(.green)

                    VStack(spacing: 24) {
                        Button(action: {
                            // Handle T-Shirt selection
                        }) {
                            VStack {
                                Image(systemName: "tshirt")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 50)
                                    .foregroundColor(.green)
                                Text("T-Shirt")
                                    .font(.body)
                                    .foregroundColor(.green)
                            }
                            .frame(width: 120, height: 120)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.green, lineWidth: 2)
                            )
                        }

                        Button(action: {
                            // Handle Cup selection
                        }) {
                            VStack {
                                Image(systemName: "cup.and.saucer")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 50)
                                    .foregroundColor(.green)
                                Text("Cup")
                                    .font(.body)
                                    .foregroundColor(.green)
                            }
                            .frame(width: 120, height: 120)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                        }

                        Button(action: {
                            // Handle Cap selection
                        }) {
                            VStack {
                                Image(systemName: "capsule")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 50)
                                    .foregroundColor(.green)
                                Text("Cap")
                                    .font(.body)
                                    .foregroundColor(.green)
                            }
                            .frame(width: 120, height: 120)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                        }
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
                    .background(Color.green)
                    .cornerRadius(30)
            }
            .padding()
        }
        .background(Color.white)
        .padding()
        .sheet(isPresented: $showSavePopup) {
            SavePopupView()
        }
    }
}






struct SavePopupView: View {
    var body: some View {
        ZStack {
            // Background color to match the popup
            Color.white
            
            VStack {
                // Title and close button row
                HStack {
                    Image(systemName: "printer") // Replace with the appropriate icon
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .padding(.leading, 8)
                    Spacer()
                    Button(action: {
                        // Close the modal
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .padding()
                    }
                }
                .padding(.top)
                .padding(.horizontal)

                // Title text
                Text("Design Studio")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color.green)
                    .padding(.bottom, 20)

                // Buttons for download options
                VStack(spacing: 16) {
                    Button(action: {
                        // Handle SVG File download
                    }) {
                        Text("SVG File")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    Button(action: {
                        // Handle High Resolution PNG download (Pro feature)
                    }) {
                        HStack {
                            Text("High Resolution PNG")
                                .font(.headline)
                            Spacer()
                            Text("PRO")
                                .font(.caption)
                                .foregroundColor(.red)
                                .bold()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                    }

                    Button(action: {
                        // Handle PDF File download (Pro feature)
                    }) {
                        HStack {
                            Text("PDF File")
                                .font(.headline)
                            Spacer()
                            Text("PRO")
                                .font(.caption)
                                .foregroundColor(.red)
                                .bold()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                    }

                    Button(action: {
                        // Close the modal
                    }) {
                        Text("Cancel")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red.opacity(0.3))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .frame(width: 400, height: 600) // Adjust the frame size as needed
        .cornerRadius(0)
        .shadow(radius: 0)
    }
}







struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(categoryName: "", imageName: "")
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
