//
//  HelperFile.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 21/11/2024.
//

import Foundation
import SwiftUI



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

 var body: some View {
     VStack(alignment: .leading) {
         HStack {
             Image(systemName: icon)
                 .foregroundColor(.white)
             Text(title)
                 .font(.headline)
                 .padding(.leading, 5)
                 .foregroundColor(.white)
         }
         .padding()
         .frame(width: 180, height: 50) // Set fixed width and height
         .background(Color.accentColor)
         .cornerRadius(30)
         .overlay(
             RoundedRectangle(cornerRadius: 30)
                 .stroke(Color.black, lineWidth: 1.5)
         )
         .padding(.vertical, 5)
         .padding(.horizontal)
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

