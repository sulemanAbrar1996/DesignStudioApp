//
//  SideMenuView.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 21/11/2024.
//

import Foundation
import SwiftUI
import StoreKit

struct SideMenuView: View {
    @Binding var selectedCategory: String?
    @Binding var showProPopup: Bool
    let menuOptions: [(String, String)]
    let additionalOptions: [(String, String)]
//    @State private var showProPopup: Bool = false
    var body: some View {
        VStack() {
            // Logo or Title section
            LogoView(selectedCategory: $selectedCategory)
            // Menu Options
            MenuOptionsView(menuOptions: menuOptions, additionalOptions: additionalOptions, showProPopup: $showProPopup, selectedCategory: $selectedCategory)
        }
        .frame(width: 320)
        .background(Color.accentColor2)
        .cornerRadius(10)
    }
}




struct MenuOptionsView: View {
    let menuOptions: [(String, String)]
    let additionalOptions: [(String, String)]
    @Binding var showProPopup: Bool
    @Binding var selectedCategory: String?
//    @State private var showProPopup: Bool = false
    var body: some View {
        VStack(alignment: .center) {
            // Primary Menu Options
            ForEach(menuOptions, id: \.0) { title, icon in
                MenuOption(title: title, icon: icon, selectedCategory: $selectedCategory)
            }
            Divider()
                .background(Color.accentColor)
            // Additional Menu Options
            ForEach(additionalOptions, id: \.0) { title, icon in
                MenuOption(title: title, icon: icon, selectedCategory: $selectedCategory)
            }
            Spacer()
            UpgradeToProButton(showProPopup: $showProPopup)
                .padding(.bottom, 20)
        }
        .padding(.horizontal, 10)
    }
}

struct UpgradeToProButton: View {
    @Binding var showProPopup: Bool // Binding from parent view

    var body: some View {
        Button(action: {
            withAnimation {
                showProPopup = true // Show the popup
            }
            print("Upgrade to Pro tapped! 2")
        }) {
            Text("Upgrade to Pro")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 160, height: 30)
                .padding(.vertical, 10)
        }
        .buttonStyle(.plain)
        .clipShape(.rect)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.black, lineWidth: 1)
        )
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.accentColor)
        )
    }
}

