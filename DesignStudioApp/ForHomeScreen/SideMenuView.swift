//
//  SideMenuView.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 21/11/2024.
//

import Foundation
import SwiftUI

struct SideMenuView: View {
    @Binding var selectedCategory: String?
    let menuOptions: [(String, String)]
    let additionalOptions: [(String, String)]

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            // Logo or Title section
            LogoView(selectedCategory: $selectedCategory)

            // Menu Options
            MenuOptionsView(menuOptions: menuOptions, additionalOptions: additionalOptions)

            Spacer()

            // Upgrade to Pro button
            UpgradeToProButton()
                .padding(.bottom, 30)
        }
        .frame(width: 300) // Fixed width for the side menu
        .padding(.top, 20)
        .background(Color.accentColor2)
        .cornerRadius(10)
    }
}

struct MenuOptionsView: View {
    let menuOptions: [(String, String)]
    let additionalOptions: [(String, String)]

    var body: some View {
        VStack(alignment: .center) {
            // Primary Menu Options
            ForEach(menuOptions, id: \.0) { title, icon in
                MenuOption(title: title, icon: icon)
            }
            
            Divider()
                .background(Color.accentColor)
                
                
            // Additional Menu Options
            ForEach(additionalOptions, id: \.0) { title, icon in
                MenuOption(title: title, icon: icon)
            }
            Spacer()
            UpgradeToProButton()
                
                .padding(.bottom, 20)
        }
        .padding(.horizontal, 10)
    }
}

struct UpgradeToProButton: View {
    var body: some View {
        Button(action: {
            // Add your upgrade logic here
            print("Upgrade to Pro tapped!")
        }) {
            Text("Upgrade to Pro")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 160, height: 30)
                .padding(.vertical, 10)
        }
        .buttonStyle(.plain)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.black, lineWidth: 1.5)
        )
        .background(Color.accentColor)
    }
}
