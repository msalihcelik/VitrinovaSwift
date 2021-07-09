
import Foundation

struct Products: Decodable {
    let id: Int?
    let code: String? // nil
    let title,slug,definition: String?
    let old_price, price, stock: Int?
    let max_installment: Int? //nil
    let commission_rate, cargo_time: Int?
    let is_cargo_free, is_new: Bool?
    let reject_reason: Int? //nil
    let category_id: Int?
    let difference: String?
    let is_editor_choice: Bool?
    let comment_count: Int?
    let is_owner, is_approved, is_active: Bool?
    let share_url: String?
    let is_liked: Bool?
    let like_count: Int?
    let shop: Shop?
    let category: Category?
    let images: [Cover]?
    let view_count: Int?
    
}
