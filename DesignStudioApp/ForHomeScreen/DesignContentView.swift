//
//  DesignContentView.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 22/11/2024.
//

import Foundation
import SwiftUI

struct DesignSection: View {
    let title: String
    let categories: [Category]
    let onCategorySelected: (Category) -> Void

    var body: some View {
        Section(header: SectionHeaderView(title: title)) {
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 150), spacing: 20)],
                spacing: 20
            ) {
                ForEach(categories, id: \.id) { category in
                    VStack {
                        Image("mainlogo") // Replace with actual image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 100)
                        Text(category.categoryName)
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .onTapGesture {
                        onCategorySelected(category)
                    }
                }
            }
        }
    }
}
