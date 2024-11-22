//
//  HomeViewModel.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 17/11/2024.
//

import Foundation

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var mainDesigns: [MainDesign] = []

    init() {
        loadMainDesigns()
    }

    // Load and decode JSON data
    func loadMainDesigns() {
        guard let url = Bundle.main.url(forResource: "templates", withExtension: "json") else {
            print("Data file not found.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            if let jsonString = String(data: data, encoding: .utf8) {
                print("File content: \(jsonString)")  // Print raw file content for debugging
            }
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(MainDesignsResponse.self, from: data)
            self.mainDesigns = decodedData.mainDesigns
            print("Loaded data: \(self.mainDesigns)")  // Debug print
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
        }
    }

}


