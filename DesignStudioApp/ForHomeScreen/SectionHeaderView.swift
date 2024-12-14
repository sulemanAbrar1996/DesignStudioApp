//
//  SectionHeaderView.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 22/11/2024.
//

import Foundation
import SwiftUI


//struct SectionHeaderView: View {
//    var title: String
//
//    var body: some View {
//        HStack {
//            Text(title)
//                .font(.title2.bold())
//                .padding(.leading)
//                .foregroundColor(.black)
//                .padding(.top, 10)
//            
//            Spacer()
//            Button(action: {
////                expandedCategoryID = (expandedCategoryID == category.id) ? nil : category.id
//                Print("See All Tapped")
//            }) {
//                Text("See All")
//                    .font(.headline)
//                    .underline(true, color: .black)
//                    .foregroundColor(.black)
//            }
//            .buttonStyle(.plain)
//        }
//    }
//}

struct SectionHeaderView: View {
    var title: String
    var onSeeAllTapped: () -> Void // Callback for "See All"

    var body: some View {
        HStack {
            Text(title)
                .font(.title2.bold())
                .padding(.leading)
                .foregroundColor(.black)
                .padding(.top, 10)
            
            Spacer()
            Button(action: {
                onSeeAllTapped()
            }) {
                Text("See All")
                    .font(.headline)
                    .underline(true, color: .black)
                    .foregroundColor(.black)
            }
            .padding()
            .buttonStyle(.plain)
        }
    }
}

