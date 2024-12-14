//
//  AsyncImageView.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 27/11/2024.
//

import Foundation
import SwiftUI


@available(macOS 12.0, *)
struct AsyncImageView: View {
    let url: String

    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            } else if let error = phase.error {
                Text("Error: \(error.localizedDescription)")
                    .foregroundColor(.red)
                    .frame(width: 100, height: 100)
            } else {
                ProgressView()
                    .frame(width: 100, height: 100)
            }
        }
        .onAppear {
            print("Loading image from URL: \(url)")
        }
    }
}
