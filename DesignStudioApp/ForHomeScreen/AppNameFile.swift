//
//  AppNameFile.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 21/11/2024.
//

import Foundation
import SwiftUI

struct AppName: View {
    var title: String
    var subtitle: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2.bold())
                .foregroundColor(.black)
            Text(subtitle)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.leading)
    }
}

struct LogoView: View {
    @Binding var selectedCategory: String?

    var body: some View {
        HStack {
            Image("mainlogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .padding()
                .onTapGesture {
                    selectedCategory = nil
                }
            AppName(
                title: "Design Studio",
                subtitle: "Design Studio"
            )
        }
    }
}
