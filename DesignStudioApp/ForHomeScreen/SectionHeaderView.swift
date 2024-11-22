//
//  SectionHeaderView.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 22/11/2024.
//

import Foundation
import SwiftUI


struct SectionHeaderView: View {
    var title: String

    var body: some View {
        Text(title)
            .font(.title2.bold())
            .padding(.leading)
            .foregroundColor(.black)
            .padding(.top, 10)
    }
}
