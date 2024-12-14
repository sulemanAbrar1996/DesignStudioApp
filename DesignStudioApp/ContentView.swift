//
//  ContentView.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 17/11/2024.
//

import SwiftUI

 
@available(macOS 12.0, *)
struct ContentView: View {
    @State private var navigateToDetail = false
    @State private var selectedCategory: String? = nil
    @State private var selectedImage: String? = nil

    var body: some View {
        if navigateToDetail {
            DetailView(
                categoryName: selectedCategory ?? "",
                imageName: selectedImage ?? "",
                onBack: {
                    navigateToDetail = false
                }
            )
        } else {
            HomeScreenView()
        }
    }
}

 
@available(macOS 12.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
