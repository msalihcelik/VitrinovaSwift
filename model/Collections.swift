
import Foundation

struct Collections: Decodable {
    let id: Int?
    let title: String?
    let definition: String?
    let start: String?
    let end: Bool?
    let share_url: String?
    let cover: Cover?
    let logo: Cover?
}
