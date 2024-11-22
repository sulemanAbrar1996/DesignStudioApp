//
//  MainContentView.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 21/11/2024.
//

import Foundation
import SwiftUI

//struct MainContentView: View {
//    @ObservedObject var viewModel: HomeViewModel
//    @Binding var selectedCategory: String?
//    @Binding var selectedImage: String?
//    @Binding var navigateToDetail: Bool
//
//    var body: some View {
//        ZStack {
//                  // Background Color for the whole window
//                 Color.gray.opacity(0.05)
//                        .edgesIgnoringSafeArea(.all)// Ensures the background covers the entire window
//                  
//                  // Main VStack with title and content
//                  VStack(spacing: 0) {
//                      VStack {
//                          AppName(title: "Design Studio", subtitle: "Get PREMIUM DESIGNS every week")
//                              .frame(maxWidth: .infinity) // Ensures the title stretches across the full width
//                              .padding(.top, 20) // Adjust top padding as necessary
//                          
//                          CategoryScrollView(
//                              viewModel: viewModel,
//                              selectedCategory: $selectedCategory
//                          )
//                      }
//                      .background(Color.accentColor3)
//                      .frame(maxWidth: .infinity) // Ensure this section fills the width
//
//                      GridContentView(
//                          viewModel: viewModel,
//                          selectedCategory: $selectedCategory,
//                          selectedImage: $selectedImage,
//                          navigateToDetail: $navigateToDetail
//                      )
//                      .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure this view expands to fill available space
//                  }
//              }
//              .padding(.top, 0) // Remove top padding if there's any unnecessary space
////        VStack(spacing: 0) {
////            VStack {
////                AppName(title: "Design Studio", subtitle: "Get PREMIUM DESIGNS every week")
////
////
////                CategoryScrollView(
////                    viewModel: viewModel,
////                    selectedCategory: $selectedCategory
////                )
////            }
////            .background(Color.accentColor3)
////            GridContentView(
////                viewModel: viewModel,
////                selectedCategory: $selectedCategory,
////                selectedImage: $selectedImage,
////                navigateToDetail: $navigateToDetail
////            )
////        }
////        .padding(.top, 30)
////        .background(Color.gray.opacity(0.05))
//    }
//}

struct MainContentView: View {
    @ObservedObject var viewModel: HomeViewModel
    @Binding var selectedCategory: String?
    @Binding var selectedImage: String?
    @Binding var navigateToDetail: Bool

    var body: some View {
        VStack(spacing: 0) {
            // App Title and Category Section at the top
            VStack {
                AppName(title: "Design Studio", subtitle: "Get PREMIUM DESIGNS every week")
                    .frame(maxWidth: .infinity) // Make the title span the full width of the screen
                    .padding(.top, 20) // Adjust padding if needed

                CategoryScrollView(
                    viewModel: viewModel,
                    selectedCategory: $selectedCategory
                )
            }
            .background(Color.accentColor3)
            .cornerRadius(15)
            .padding(.top, -65)
            .ignoresSafeArea()
            
            // Main content section
            GridContentView(
                viewModel: viewModel,
                selectedCategory: $selectedCategory,
                selectedImage: $selectedImage,
                navigateToDetail: $navigateToDetail
            )
        }
        .background(Color.gray.opacity(0.05)) // Light background for the main content area
    }
}
