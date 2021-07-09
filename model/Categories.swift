
import Foundation

struct Categories: Decodable {
    let id: Int?
    let name: String?
    let parent_id: Int?
    let order: Int?
    let parent_category: Parent_category?
    let logo: Cover?
    let cover: Cover?
    let children: [Categories]?
}
