//
//  ProUpgradePopup.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 12/12/2024.
//

import Foundation
import SwiftUI
import StoreKit


@available(macOS 12.0, *)
struct ProUpgradePopup: View {
    @Binding var isPresented: Bool
    @State private var selectedPlan: Product?
    @StateObject private var subscriptionManager = SubscriptionManager()
    let mockupImage: String // Pass the mockup image name

    var body: some View {
        ZStack {
            if isPresented {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    HStack {
                        Button(action: {
                            Task {
                                await subscriptionManager.restorePurchases()
                            }
                        }) {
                            Text("Restore")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .background(Color.red)
                                .cornerRadius(8)
                        }
                        .buttonStyle(.plain)
                        .padding()

                        Spacer()

                        Button(action: {
                            isPresented = false
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.headline)
                                .foregroundColor(Color.accentColor)
                                .padding()
                        }
                        .buttonStyle(.plain)
                    }

                    HStack(spacing: 10) {
                        Image(mockupImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400, height: 600)
                            .cornerRadius(12)

                        VStack(spacing: 8) {
                            Text("DESIGN STUDIO PRO")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)

                            Text("GET UNLIMITED ACCESS TO ALL PREMIUM FEATURES")
                                .font(.subheadline)
                                .foregroundColor(.gray)

                            // Subscription plans
                            if subscriptionManager.products.isEmpty {
                                ProgressView("Loading Plans...")
                            } else {
                                ForEach(sortedProducts(subscriptionManager.products), id: \.id) { product in
                                    PlanView(planName: product.displayName,
                                             price: product.displayPrice,
                                             tag: tagForProduct(product),
                                             isSelected: selectedPlan == product) {
                                        selectedPlan = product
                                    }
                                }
                            }

                            // Start Free Trial Button
                            Button(action: {
                                if let plan = selectedPlan {
                                    Task {
                                        await subscriptionManager.purchase(product: plan)
                                    }
                                }
                            }) {
                                VStack{
                                    Text("Start 3 Days Free Trial")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.red)
                                        .cornerRadius(35)
                                }
                            }
                            .buttonStyle(.plain)

                            Text("Cancel anytime, for any reason")
                                .font(.footnote)
                                .foregroundColor(.gray)

                            HStack(spacing: 4) {
                                Button(action: {
                                    // Privacy Policy action
                                }) {
                                    Text("Privacy Policy")
                                        .font(.footnote)
                                        .foregroundColor(.black)
                                }
                                .buttonStyle(.plain)

                                Text("|")
                                    .font(.footnote)
                                    .foregroundColor(.gray)

                                Button(action: {
                                    // Terms and Conditions action
                                }) {
                                    Text("Terms & Conditions")
                                        .font(.footnote)
                                        .foregroundColor(.black)
                                }
                                .buttonStyle(.plain)
                            }

                            Text("Payment will be charged to your iTunes account at confirmation of purchase. Your subscription will automatically renew unless auto-renew is turned off at least 24-hours before the end of the current subscription period. Your account will be charged for renewal within 24-hours prior to the end of current subscription period. Automatic renewals will cost the same price you were originally charged for the subscription.")
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding(.top, 4)
                        }
                        .frame(width: 400)
                    }
                }
                .frame(width: 900, height: 700)
                .background(Color.accentColor2)
                .cornerRadius(20)
                .shadow(radius: 10)
                .task {
                    await subscriptionManager.fetchProducts()
                }
            }
        }
        .animation(.easeInOut, value: isPresented)
    }
    
    // Function to return dynamic tags
    private func tagForProduct(_ product: Product) -> String {
           switch product.id {
           case "weekly_sub_cutdesign_mac": return "Basic"
           case "monthly_sub_cutdesign_mac": return "Plus"
           case "yearly_sub_cutdesign_mac": return "Gold"
           default: return "Unknown"
           }
       }
    // Function to sort products by plan type
        private func sortedProducts(_ products: [Product]) -> [Product] {
            let sortOrder: [String: Int] = [
                "weekly_sub_cutdesign_mac": 1,
                "monthly_sub_cutdesign_mac": 2,
                "yearly_sub_cutdesign_mac": 3
            ]

            return products.sorted { (sortOrder[$0.id] ?? 4) < (sortOrder[$1.id] ?? 4) }
        }
}
struct PlanView: View {
    let planName: String
    let price: String
    let tag: String
    let isSelected: Bool
    let onSelect: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(planName)
                    .font(.headline)
                    .foregroundColor(.black)
                Text(price)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            Text(tag)
                .font(.headline)
                .foregroundColor(isSelected ? .white : .buttonGreen)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(isSelected ? Color.buttonGreen : Color.clear)
                .cornerRadius(35)
                .overlay(
                    RoundedRectangle(cornerRadius: 35)
                        .stroke(isSelected ? Color.buttonGreen : Color.gray, lineWidth: 2)
                )
        }
        .padding()
        .background(isSelected ? Color.buttonGreen.opacity(0.1) : Color.clear)
        .cornerRadius(35)
        .overlay(
            RoundedRectangle(cornerRadius: 35)
                .stroke(Color.black, lineWidth: 1.0)
        )
        .onTapGesture {
            onSelect()
        }
    }
}

enum Plan {
    case weekly, monthly, yearly

    func trialDescription(with rates: [String: Double], currency: String) -> String {
        let usdPrice: Double
        switch self {
        case .weekly: usdPrice = 3.99
        case .monthly: usdPrice = 9.99
        case .yearly: usdPrice = 39.99
        }
        let localizedPrice = usdPrice
        return "then \(localizedPrice)"
    }
}
