//
//  CategoryScrollView.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 21/11/2024.
//

import Foundation
import SwiftUI

struct CategoryScrollView: View {
    var viewModel: HomeViewModel
    @Binding var selectedCategory: String?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(){
                HStack(spacing: 0) {
                    ForEach(viewModel.mainDesigns, id: \.id) { category in
                        Text(category.title)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .clipShape(RoundedTopRectangle(cornerRadius: 10))
                            .overlay(
                             RoundedTopRectangle(cornerRadius: 10)
                                .stroke(.buttonGreen, lineWidth: 1)
                            )
                            .onTapGesture {
                                selectedCategory = category.title
                            }
                    }
                }
            }
            .padding(.top, 20)
            .background(Color.accentColor3)
//            .padding(.horizontal, 20)
        }
        
        .padding(.top, 20)
    }
}
