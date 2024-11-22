//
//  HomeModels.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 17/11/2024.
//


struct MainDesignsResponse: Codable {
    var mainDesigns: [MainDesign]
    
    enum CodingKeys: String, CodingKey {
        case mainDesigns = "mainDesigns"
    }
}

struct MainDesign: Identifiable, Codable {
    var id: String { title }
    var title: String
    var bucketName: String
    var trending: Trending
    var categories: [Category]
    
    enum CodingKeys: String, CodingKey {
        case title
        case bucketName
        case trending
        case categories = "Categories" // Custom key mapping here
    }
}

struct Trending: Codable {
    var mainUrl: String
    var templates: [String]
    
    enum CodingKeys: String, CodingKey {
        case mainUrl
        case templates
    }
}

struct Category: Identifiable, Codable {
    var id: String { categoryName }
    var categoryTitle: String
    var categoryName: String
    var count: Int
    
    enum CodingKeys: String, CodingKey {
        case categoryTitle = "categoryTitle"
        case categoryName
        case count
    }
}
