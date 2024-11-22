//
//  GridContentView.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 21/11/2024.
//

import Foundation
import SwiftUI

struct GridContentView: View {
    var viewModel: HomeViewModel
    @Binding var selectedCategory: String?
    @Binding var selectedImage: String?
    @Binding var navigateToDetail: Bool

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                let filteredDesigns = viewModel.mainDesigns.filter { design in
                    selectedCategory == nil || selectedCategory == design.title
                }

                ForEach(filteredDesigns, id: \.id) { design in
                    DesignSection(
                        title: design.title,
                        categories: design.categories,
                        onCategorySelected: { category in
                            selectedCategory = design.title
                            selectedImage = category.categoryName
                            navigateToDetail = true
                        }
                    )
                }
            }
        }
        .padding(.bottom, 40)
    }
}
