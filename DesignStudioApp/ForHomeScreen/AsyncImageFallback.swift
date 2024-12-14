//
//  AsyncImageFallback.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 03/12/2024.
//


import SwiftUI


struct AsyncImageFallback: View {
    let url: String

    @State private var imageData: Data? = nil

    var body: some View {
        if let imageData = imageData, let image = Image(data: imageData) {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
        } else {
            ProgressView()
                .frame(width: 100, height: 100)
                .onAppear {
                    fetchImage()
                }
        }
    }

    private func fetchImage() {
        let cleanUrl = url.trimmingCharacters(in: .whitespacesAndNewlines)

        guard let validUrl = URL(string: cleanUrl) else { return }
        
        URLSession.shared.dataTask(with: validUrl) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    self.imageData = data
                }
            } else {
                print("Error fetching image: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()
    }
}

extension Image {
    init?(data: Data) {
        #if os(macOS)
        guard let nsImage = NSImage(data: data) else { return nil }
        self.init(nsImage: nsImage)
        #else
        guard let uiImage = UIImage(data: data) else { return nil }
        self.init(uiImage: uiImage)
        #endif
    }
}
