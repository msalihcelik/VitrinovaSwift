import Foundation

struct Home: Decodable {
    let type, title: String?
    let featured: [Featured]?
    let products: [Products]?
    let categories: [Categories]?
    let collections: [Collections]?
    let shops: [Shops]?
}
