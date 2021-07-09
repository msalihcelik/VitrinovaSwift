
import Foundation

struct Shops: Decodable {
    let id: Int?
    let name, slug, definition: String?
    let name_updateable: Bool?
    let vacation_mode: Int?
    let created_at: String?
    let shop_payment_id: Int?
    let popular_products: [Products]?
    let product_count, shop_rate, comment_count, follower_count: Int?
    let is_editor_choice: Bool?
    let is_following: Bool?
    let share_url: String?
    let cover: Cover?
    let logo: Cover?
}
