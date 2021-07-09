
import Foundation

struct Category: Decodable {
    let id: Int?
    let name: String?
    let parent_id, order: Int?
    let parent_category: Parent_category?
}
