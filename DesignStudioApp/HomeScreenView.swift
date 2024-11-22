//
//  HomeScreenView.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 17/11/2024.
//

import SwiftUI

@available(macOS 13.0, *)
struct HomeScreenView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var selectedCategory: String? = nil
    @State private var selectedImage: String? = nil
    @State private var navigateToDetail: Bool = false
    
    var body: some View {
            GeometryReader { geometry in
                    HStack(spacing: 0) {
                        SideMenuView(
                            selectedCategory: $selectedCategory,
                            menuOptions: menuOptions,
                            additionalOptions: additionalOptions
                        )
                        
                        MainContentView(
                            viewModel: viewModel,
                            selectedCategory: $selectedCategory,
                            selectedImage: $selectedImage,
                            navigateToDetail: $navigateToDetail
                        )
                    }
                    .background(Color.white)
                }
        }
}
#Preview {
    if #available(macOS 13.0, *) {
        HomeScreenView()
            .frame(minWidth: 800, minHeight: 600) 
    } else {
        // Fallback on earlier versions
    }
}
