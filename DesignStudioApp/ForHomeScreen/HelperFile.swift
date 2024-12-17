//
//  HelperFile.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 21/11/2024.
//

import Foundation
import SwiftUI

let baseURLImage = "https://cutdesigns.s3.us-east-1.amazonaws.com/"
    


struct RoundedTopRectangle: Shape {
    var cornerRadius: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let width = rect.width
        let height = rect.height

        path.move(to: CGPoint(x: 0, y: cornerRadius))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: width, y: cornerRadius))
        path.addQuadCurve(to: CGPoint(x: width - cornerRadius, y: 0), control: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: cornerRadius, y: 0))
        path.addQuadCurve(to: CGPoint(x: 0, y: cornerRadius), control: CGPoint(x: 0, y: 0))
        path.closeSubpath()

        return path
    }
}
// Menu Option Component
struct MenuOption: View {
    var title: String
    var icon: String
    @Binding var selectedCategory: String?

    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                let cleanedTitle = title.contains("SVG")
                                   ? title.replacingOccurrences(of: "SVG", with: "").trimmingCharacters(in: .whitespaces)
                                   : title
                               selectedCategory = cleanedTitle // Update the selected category
            }) {
                HStack {
                    Image(systemName: icon)
                        .foregroundColor(.white)
                    Text(title)
                        .font(.headline)
                        .padding(.leading, 5)
                        .foregroundColor(.white)
                }
                .padding()
                
                .frame(width: 180, height: 50)
                .background(selectedCategory == title ? Color.buttonGreen : Color.accentColor)
                .cornerRadius(30)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding(.vertical, 5)
                .padding(.horizontal)
            }
            .buttonStyle(.plain)
        }
    }
}

// Design Item Component
struct DesignItemView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.gray, lineWidth: 2)
                .frame(height: 200)
                .overlay(
                 Image("mainlogo")
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(width: 200, height: 200)
                )
                .frame(width: 200, height: 200)
        }
    }
}


let s3BaseURL = "https://cutdesigns.s3.us-east-1.amazonaws.com/"
let s3Type    = "/svg/"
let s3Design  = "/design"
let s3ImageType2 = ".svg"

// Menu Options
let menuOptions = [
    ("SVG Cut Files", "scissors"),
    ("Sublimations", "circle.grid.3x3.fill"),
    ("Monograms", "a.circle"),
    ("Watercolor", "paintbrush.fill"),
    ("Stickers", "smiley"),
    ("Shapes", "square.on.square")
]

let additionalOptions = [
    ("Rate Us", "star"),
    ("Support", "headphones")
]



// Category Item Component
struct CategoryItem: View {
    let title: String
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Text(title)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(isSelected ? Color.accentColor : Color.gray)
            .foregroundColor(.white)
            .clipShape(RoundedTopRectangle(cornerRadius: 10))
            .overlay(
                RoundedTopRectangle(cornerRadius: 12)
                    .stroke(.black, lineWidth: 2)
            )
            .onTapGesture {
                onTap()
            }
    }
}

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}


struct CustomButton: View {
    var title: String
    var backgroundColor: Color
    var textColor: Color
    var isPro: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .foregroundColor(textColor)
                if isPro {
                    Spacer()
                    Text("PRO")
                        .font(.caption)
                        .foregroundColor(.red)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(8)
        }
        .buttonStyle(.plain)
    }
}
// MARK: - Helper Extension for Color

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}
