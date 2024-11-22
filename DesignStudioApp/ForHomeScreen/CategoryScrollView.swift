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
            HStack(spacing: 15){
                HStack(spacing: 0) {
                    ForEach(viewModel.mainDesigns, id: \.id) { category in
                        Text(category.title)
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
                                selectedCategory = category.title
                            }
                    }
                }
//                           .padding()
            }
            .padding(.top, 20)
            .background(Color.accentColor3)
//            {
//                ForEach(viewModel.mainDesigns, id: \.id) { design in
//                    Text(design.title)
//                        .padding(.horizontal, 20)
//                        .padding(.vertical, 10)
//                        .background(Color.accentColor)
//                        .cornerRadius(8)
//                        .onTapGesture {
//                            selectedCategory = design.title
//                        }
//                }
//                .overlay(
//                    RoundedRectangle(cornerRadius: 12)
//                        .stroke(Color.black, lineWidth: 1.2)
//                )
//            }
            .padding(.horizontal, 20)
        }
        
        .padding(.top, 20)
    }
}
