//
//  GridContentView.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 21/11/2024.
//

import Foundation
import SwiftUI

@available(macOS 12.0, *)
struct GridContentView: View {
    var viewModel: HomeViewModel
    @Binding var selectedCategory: String?
    @Binding var selectedImage: String?
    @Binding var navigateToDetail: Bool
    @Binding var showProPopup: Bool
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                let filteredDesigns = viewModel.mainDesigns.filter { design in
                    selectedCategory == nil || selectedCategory == design.title
                }
                if selectedCategory == nil {
                    Print("FILTERED DESIGNS: \(filteredDesigns)")
                    ForEach(filteredDesigns, id: \.id) { design in
                        DesignSection(
                            title: design.title,
                            bucketName: design.bucketName,
                            categories: design.categories,
                            onCategorySelected: { category in
                                selectedCategory = design.title
                                selectedImage = category.categoryName
                                navigateToDetail = true
                            }, onSeeAllTapped: {
                                selectedCategory = design.title // Show only the selected section
                            }, showProPopup: $showProPopup
                        )
                    }
                }
                if selectedCategory != nil {
                    ForEach(filteredDesigns, id: \.id) { design in
                        DesignSection2(
                            title: design.title,
                            bucketName: design.bucketName,
                            categories: design.categories,
                            onCategorySelected: { category in
                                selectedCategory = design.title
                                selectedImage = category.categoryName
                                navigateToDetail = true
                            }, onSeeAllTapped: {
                                selectedCategory = design.title // Show only the selected section
                            }, showProPopup: $showProPopup
                        )
                    }
                }
            }
        }
        .padding(.bottom, 40)
    }
}
