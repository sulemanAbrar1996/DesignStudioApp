import StoreKit

@available(macOS 12.0, *)
class SubscriptionManager: ObservableObject {
    @Published var products: [Product] = []
    @Published var purchasedProductIDs: Set<String> = []

    // Fetch products from App Store Connect
    func fetchProducts() async {
        do {
            let productIDs = ["weekly_sub_cutdesign_mac", "monthly_sub_cutdesign_mac", "yearly_sub_cutdesign_mac"]
            let storeProducts = try await Product.products(for: productIDs)

            // Debug: Check if products are fetched
            print("Fetched products: \(storeProducts.map { $0.displayName })")

            DispatchQueue.main.async {
                self.products = storeProducts
            }
        } catch {
            print("Failed to fetch products: \(error.localizedDescription)")
        }
    }

    // Purchase a selected product
    func purchase(product: Product) async {
        do {
            let result = try await product.purchase()

            switch result {
            case .success(let verification):
                switch verification {
                case .verified(let transaction):
                    // Debug: Check the product ID and mark it as purchased
                    print("Purchase successful for product: \(transaction.productID)")
                    DispatchQueue.main.async {
                        self.purchasedProductIDs.insert(transaction.productID)
                    }
                    await transaction.finish()
                case .unverified(_, let error):
                    print("Purchase failed verification: \(error.localizedDescription)")
                }
            case .pending:
                print("Purchase pending")
            case .userCancelled:
                print("User canceled the purchase")
            @unknown default:
                print("Unknown purchase result")
            }
        } catch {
            print("Purchase failed: \(error.localizedDescription)")
        }
    }

    // Restore previous purchases
    func restorePurchases() async {
        do {
            for try await result in Transaction.currentEntitlements {
                switch result {
                case .verified(let transaction):
                    // Debug: Check the restored product ID
                    print("Restored product: \(transaction.productID)")
                    DispatchQueue.main.async {
                        self.purchasedProductIDs.insert(transaction.productID)
                    }
                    await transaction.finish()
                case .unverified(_, let error):
                    print("Restore failed for product: \(error.localizedDescription)")
                }
            }
        } catch {
            print("Restore error: \(error.localizedDescription)")
        }
    }
}

