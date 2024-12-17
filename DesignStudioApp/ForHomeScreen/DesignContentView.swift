//
//  DesignContentView.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 22/11/2024.
//

import Foundation
import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

@available(macOS 12.0, *)
struct DesignSection: View {
    let title: String
    let bucketName: String
    let categories: [Category]
    let onCategorySelected: (Category) -> Void
    let onSeeAllTapped: () -> Void
    @Binding var showProPopup: Bool
    
    var body: some View {
        Section(header: SectionHeaderView(title: title, onSeeAllTapped: onSeeAllTapped)) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(Array(categories.enumerated()), id: \.1.id) { index, category in
                        ZStack {
                            VStack {
                                let imageURL = baseURLImage + bucketName + "/thumbnails/" + category.categoryName + "/thumbnail" + String(index) + ".png"
                                Print("IMAGE URL: \(imageURL)")
                                if let url = URL(string: imageURL) {
                                    AsyncImage(url: url) { phase in
                                        if let image = phase.image {
                                            image
                                                .resizable()
                                                .scaledToFill()
                                                .padding()
                                                .frame(width: 150, height: 150, alignment: .center)
                                        } else if phase.error != nil {
                                            Image(systemName: "photo")
                                                .resizable()
                                                .scaledToFill()
                                                .padding()
                                                .foregroundColor(.accentColor)
                                                .frame(width: 150, height: 150, alignment: .center)
                                        } else {
                                            Image(systemName: "photo")
                                                .resizable()
                                                .scaledToFill()
                                                .padding()
                                                .foregroundColor(.accentColor)
                                                .frame(width: 150, height: 150, alignment: .center)
                                            ProgressView()
                                        }
                                    }
                                }
                            }
                            .frame(width: 150, height: 150)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.black, lineWidth: 3)
                            )
                            .onTapGesture {
                                if index < 3 {
                                    onCategorySelected(category)
                                } else {
                                    showProPopup = true
                                }
                            }
                            
                            // Add lock overlay for items beyond the first 3
                            if index >= 3 {
                                Image("premiumImage")
                                    .foregroundColor(.white)
                                    .frame(width: 30, height: 30)
                                    .position(x: 140, y: 20) // Top-right corner of the item
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 15)
        }
    }
}

@available(macOS 12.0, *)
struct DesignSection2: View {
    let title: String
    let bucketName: String
    let categories: [Category]
    let onCategorySelected: (Category) -> Void
    let onSeeAllTapped: () -> Void
    @Binding var showProPopup: Bool

    var body: some View {
        Section(header: SectionHeaderView(title: title, onSeeAllTapped: onSeeAllTapped)) {
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 180), spacing: 30)],
                spacing: 20
            ) {
                ForEach(Array(categories.enumerated()), id: \.1.id) { index, category in
                    ZStack {
                        VStack {
                            let imageURL = baseURLImage + bucketName + "/thumbnails/" + category.categoryName + "/thumbnail" + String(index) + ".png"
                            Print("IMAGE URL: \(imageURL)")
                            if let url = URL(string: imageURL) {
                                AsyncImage(url: url) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .padding()
                                            .frame(width: 150, height: 150, alignment: .center)
                                    } else if phase.error != nil {
                                        Image(systemName: "photo")
                                            .resizable()
                                            .scaledToFit()
                                            .padding()
                                            .foregroundColor(.accentColor)
                                            .frame(width: 150, height: 150, alignment: .center)
                                    } else {
                                        Image(systemName: "photo")
                                            .resizable()
                                            .scaledToFit()
                                            .padding()
                                            .foregroundColor(.accentColor)
                                            .frame(width: 150, height: 150, alignment: .center)
                                        ProgressView()
                                    }
                                }
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 3)
                        )
                        .onTapGesture {
                            if index < 3 {
                                onCategorySelected(category)
                            } else {
                                showProPopup = true
                            }
                        }
                        
                        // Add lock overlay for items beyond the first 3
                        if index >= 3 {
                            Image("premiumImage")
                                .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                                .position(x: 140, y: 20) // Top-right corner of the item
                        }
                    }
                }
            }
            .padding(.horizontal, 15)
        }
    }
}


//@available(macOS 12.0, *)
//struct DesignSection: View {
//    let title: String
//    let categories: [Category]
//    let onCategorySelected: (Category) -> Void
//    let onSeeAllTapped: () -> Void // Closure for "See All" action
//    @Binding var showProPopup: Bool
//    
//    var body: some View {
//        Section(header: SectionHeaderView(title: title, onSeeAllTapped: onSeeAllTapped)) {
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 15) {
//                    ForEach(categories, id: \.id) { category in
//                        VStack {
//                            if let url = URL(string: category.categoryName) {
//                                AsyncImage(url: url) { phase in
//                                    if let image = phase.image {
//                                        // Image successfully loaded
//                                        image
//                                            .resizable()
//                                            .scaledToFill()
//                                            .padding()
//                                            .frame(width: 150, height: 150, alignment: .center)
//                                            
//                                        
//                                    } else if phase.error != nil {
//                                        // Show error message if image fails to load
//                                        Image(systemName: "photo")
//                                            .resizable()
//                                            .scaledToFill()
//                                            .padding()
//                                            .foregroundColor(.accentColor)
//                                            .frame(width: 150, height: 150, alignment: .center)
//                                            
//
//                                        //                                    Text(error.localizedDescription)
//                                        //                                        .foregroundColor(.red)
//                                    } else {
//                                        // Show a loading indicator while the image loads
//                                        Image(systemName: "photo")
//                                            .resizable()
//                                            .scaledToFill()
//                                            .padding()
//                                            .foregroundColor(.accentColor)
//                                            .frame(width: 150, height: 150, alignment: .center)
//
//                                        
//                                        ProgressView()
//                                    }
//                                }
//                            }
//                        }
//                        .padding()
//                        .background(Color.white)
//                        .cornerRadius(10)
//                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
//                        .onTapGesture {
////                            if index < 3 {
//                                onCategorySelected(category)
////                            }
////                            else {
////                                showProPopup = true
////                            }
//                        }
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 15)
//                                .stroke(Color.black, lineWidth: 3)
//                        )
//                    }
//                }
//            }
//            .padding(.horizontal, 15)
//        }
//    }
//}
//@available(macOS 12.0, *)
//struct DesignSection2: View {
//    let title: String
////    let mainDesigns: [MainDesign]
//    let categories: [Category]
//    let onCategorySelected: (Category) -> Void
//    let onSeeAllTapped: () -> Void
//    @Binding var showProPopup: Bool
//    
//    @State private var loadedImage: NSImage? = nil
//    @State private var imageLoadError: String? = nil
//
//    var body: some View {
//        Section(header: SectionHeaderView(title: title, onSeeAllTapped: onSeeAllTapped)) {
//                LazyVGrid(
//                    columns: [GridItem(.adaptive(minimum: 150), spacing: 20)],
//                    spacing: 20
//                ) {
//                    ForEach(categories, id: \.id) { category in
//                        VStack {
//                            //                      VStack {
//                            if let url = URL(string: category.categoryName) {
//                                AsyncImage(url: url) { phase in
//                                    if let image = phase.image {
//                                        // Image successfully loaded
//                                        image
//                                            .resizable()
//                                            .scaledToFit()
//                                            .padding()
//                                            .frame(width: 150, height: 150, alignment: .center)
//                                        
//                                    } else if phase.error != nil {
//                                        // Show error message if image fails to load
//                                        Image(systemName: "photo")
//                                            .resizable()
//                                            .scaledToFit()
//                                            .padding()
//                                            .foregroundColor(.accentColor)
//                                            .frame(width: 150, height: 150, alignment: .center)
//                                        //                                    Text(error.localizedDescription)
//                                        //                                        .foregroundColor(.red)
//                                    } else {
//                                        // Show a loading indicator while the image loads
//                                        Image(systemName: "photo")
//                                            .resizable()
//                                            .scaledToFit()
//                                            .padding()
//                                            .foregroundColor(.accentColor)
//                                            .frame(width: 150, height: 150, alignment: .center)
//                                        
//                                        ProgressView()
//                                    }
//                                }
//                            }
//                            Print("Image URL: \(category.categoryName)")
//                            //                        Text(category.categoryTitle)
//                            //                            .font(.headline)
//                            //                            .foregroundColor(.black)
//                        }
//                        .padding()
//                        .background(Color.white)
//                        .cornerRadius(10)
//                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 15)
//                                .stroke(Color.black, lineWidth: 3)
//                        )
//                        .onAppear {
//                            fetchImage(from: category.categoryName) // Trigger image fetching when view appears
//                        }
//                        .onTapGesture {
////                            if index < 3 {
//                                onCategorySelected(category)
////                            }
////                            else {
////                                showProPopup = true
////                            }
//                        }
//                    }
//                }
//            }
//            .padding(.leading, 15)
//            .padding(.trailing, 15)
//    }
//    
//    
//    func fetchImage(from urlString: String) {
//        guard let url = URL(string: urlString) else {
//            imageLoadError = "Invalid URL"
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                DispatchQueue.main.async {
//                    imageLoadError = "Error fetching image: \(error.localizedDescription)"
//                    print("Error fetching image: \(error.localizedDescription)") // Debugging log
//                }
//                return
//            }
//            
//            if let httpResponse = response as? HTTPURLResponse {
//                // Check if response status code is 200 (OK)
//                if httpResponse.statusCode != 200 {
//                    DispatchQueue.main.async {
//                        imageLoadError = "Failed to fetch image. Status code: \(httpResponse.statusCode)"
//                        print("Failed to fetch image. Status code: \(httpResponse.statusCode)") // Debugging log
//                    }
//                    return
//                }
//            }
//            
//            if let data = data, let nsImage = NSImage(data: data) {
//                DispatchQueue.main.async {
//                    loadedImage = nsImage
//                    imageLoadError = nil
//                }
//            } else {
//                DispatchQueue.main.async {
//                    imageLoadError = "Failed to load image data."
//                    print("Failed to load image data.") // Debugging log
//                }
//            }
//        }
//        
//        task.resume()
//    }
//}


@ViewBuilder
private func imageView(for image: Image) -> some View {
    image
//        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 100)
        .cornerRadius(10)
}

@ViewBuilder
private func errorPlaceholderView() -> some View {
    Image("mainlogo")
//        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 100)
        .foregroundColor(.gray)
}

@ViewBuilder
private func loadingPlaceholderView() -> some View {
    ProgressView()
        .frame(width: 100, height: 100)
}

