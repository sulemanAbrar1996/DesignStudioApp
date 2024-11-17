//
//  HomeScreenView.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 17/11/2024.
//

import SwiftUI

struct HomeScreenView: View {
    @State private var selectedCategory = "Halloween"
       let categories = ["Halloween", "Christmas", "Thanksgiving", "Birthday", "Black Friday", "Children Day", "Funny"]

       var body: some View {
           HStack(spacing: 0) {
               // Side Menu
               VStack(alignment: .center) {
                   HStack {
                       Image("mainlogo") // Replace with your logo image name
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 100, height: 100) // Adjust the size as needed
                           .padding()
                       VStack(alignment: .leading) {
                           Text("Design Studio")
                               .font(.title2.bold())
                               .padding(.leading)
                           
                           Text("Best App for Design")
                               .font(.caption)
                               .foregroundColor(.gray)
                               .padding(.leading)
                       }
                   }
                   
                   
                   
                   // Menu Options
                   MenuOption(title: "SVG Cut Files", icon: "scissors")
                   MenuOption(title: "Sublimations", icon: "circle.grid.3x3.fill")
                   MenuOption(title: "Monograms", icon: "a.circle")
                   MenuOption(title: "Watercolor", icon: "paintbrush.fill")
                   MenuOption(title: "Stickers", icon: "smiley")
                   MenuOption(title: "Shapes", icon: "square.on.square")
                   
                   Divider()
                   
                   MenuOption(title: "Rate US", icon: "star")
                   MenuOption(title: "Support", icon: "headphones")
                   
                   Spacer()
                   
                   // Upgrade to Pro Button
//                   Button(action: {
//                       print("Upgrade to Pro tapped")
//                   }) {
//                       Text("Upgrade to Pro")
//                           .bold()
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color.accentColor)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                          }
//                          .padding(.horizontal)
//                          .padding(.bottom)
                Text("Upgrade to Pro")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 180, height: 50) // Set fixed width and height
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                           .stroke(Color.black, lineWidth: 1.5))
                    .padding(.vertical, 5)
                    .padding(.horizontal)
               }
               
               .frame(width: 300)
               .padding(.top, 20)
               .background(Color.accentColor2)
               
               // Main Content
               VStack {
                   // Add top padding
                   VStack(spacing: 0) {
                           Text("Design Studio")
                               .font(.title2.bold())
//                               .padding()
                           
                           Text("Get PREMIUM  DESIGNS in every week")
                               .font(.caption)
                               .foregroundColor(.black)
//                               .padding(.leading)
                       
                       // Top Navigation Bar
                       ScrollView(.horizontal, showsIndicators: false) {
                           HStack(spacing: 0) {
                               ForEach(categories, id: \.self) { category in
                                   Text(category)
                                       .padding(.vertical, 10)
                                       .padding(.horizontal, 20)
                                       .background(Color.accentColor)
                                       .foregroundColor(.white)
                                       .clipShape(RoundedTopRectangle(cornerRadius: 10))
                                       .overlay(
                                        RoundedTopRectangle(cornerRadius: 12)
                                            .stroke(.black, lineWidth: 2)
                                       )
                                       .onTapGesture {
                                           selectedCategory = category
                                       }
                               }
                           }
//                           .padding()
                       }
                       .padding(.top, 20)
                       .background(Color.accentColor3)
                       
                       // Grid Content
                       ScrollView {
                                 VStack(alignment: .leading) {
                                     ForEach(categories, id: \.self) { category in
                                         Section(header: Text(category)
                                             .font(.title2.bold())
                                             .padding(.leading)
                                             .padding(.top, 10)) {
                                             
                                             GeometryReader { geometry in
                                                 let itemWidth: CGFloat = 200 // Desired item width
                                                 let columns = Int(geometry.size.width / itemWidth)
                                                 let gridItems = Array(repeating: GridItem(.flexible()), count: max(columns, 1))
                                                 
                                                 LazyVGrid(columns: gridItems, spacing: 10) {
                                                     ForEach(0..<10) { index in
                                                         DesignItemView()
                                                     }
                                                 }
                                                 .padding(.horizontal)
                                             }
                                             .frame(height: 400) // Adjust height for the GeometryReader
                                         }
                                     }
                                 }
                             }
                             .background(Color.white)
                   }
                   .padding(.top, 10) // Added top padding here
               }
               .padding(.top, 30)
               .background(Color.accentColor3)
           }
           .background(Color.white)
           .ignoresSafeArea()
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


#Preview {
    HomeScreenView()
        .frame(width: 1200, height: 800)
}

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
