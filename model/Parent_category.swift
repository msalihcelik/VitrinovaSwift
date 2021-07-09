
import Foundation

class Parent_category: Decodable {
    let id: Int?
    let name: String?
    let parent_id: Int? //nil
    let order: Int?
    let parent_category: Parent_category? //nil
}
