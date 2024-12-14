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
        VStack(alignment: .center) {
            Text(title)
                .font(.title2.bold())
                .lineLimit(0)
                .foregroundColor(.black)
            Text(subtitle)
                .font(.caption)
                .foregroundColor(.gray)
        }
//        .padding(.trailing, 10)
    }
}

struct LogoView: View {
    @Binding var selectedCategory: String?

    var body: some View {
        HStack(){
            Image("mainlogo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .padding()
                .onTapGesture {
                    selectedCategory = nil
                }
            VStack(alignment: .leading){
                AppName(
                    title: "Design Studio",
                    subtitle: "Best App for Design"
                )
                
                Image("stars")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
//                    .padding()
            }
        }
    }
}
