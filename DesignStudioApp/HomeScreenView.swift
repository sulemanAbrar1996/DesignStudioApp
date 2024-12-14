//
//  HomeScreenView.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 17/11/2024.
//

import SwiftUI

 
@available(macOS 12.0, *)
struct HomeScreenView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var selectedCategory: String? = nil
    @State private var selectedImage: String? = nil
    @State private var navigateToDetail: Bool = false
    @State private var showProPopup: Bool = false // State to control popup visibility


    var body: some View {
            GeometryReader { geometry in
                if navigateToDetail, let category = selectedCategory, let imageURL = selectedImage {
                               // Pass the category and image URL to DetailView
                    DetailView(categoryName: category, imageName: imageURL) {
                                   navigateToDetail = false
                               }
                           }
                else {
                    HStack(spacing: 0) {
                        SideMenuView(
                            selectedCategory: $selectedCategory,
                            showProPopup: $showProPopup,
                            menuOptions: menuOptions,
                            additionalOptions: additionalOptions
                        )
                        
                        MainContentView(
                            viewModel: viewModel,
                            selectedCategory: $selectedCategory,
                            selectedImage: $selectedImage,
                            navigateToDetail: $navigateToDetail,
                            showProPopup: $showProPopup
                        )
                    }
                    .background(Color.white)
                    // Show Pro Upgrade Popup
                               if showProPopup {
                                   ProUpgradePopup(isPresented: $showProPopup, mockupImage: "proImages")
                               }
                }
            }
        }
}


#Preview {
    if #available(macOS 12.0, *) {
        HomeScreenView()
            .frame(minWidth: 800, minHeight: 600) 
    } else {
        // Fallback on earlier versions
    }
}


