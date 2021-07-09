
import Foundation

struct Shop: Decodable {
    let id: Int?
    let name, slug, definition: String?
    let name_updateable: Bool?
    let vacation_mode: Int?
    let created_at: String?
    let shop_payment_id, product_count, shop_rate, comment_count, follower_count: Int?
    let is_editor_choice: Bool?
    let is_following: Bool?
    let cover: Cover?
    let share_url: String?
    let logo: Cover?
    let popular_products: [Products]?
}
