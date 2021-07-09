
import Foundation

struct Featured: Decodable {
    let id: Int?
    let type,title,sub_title: String?
    let cover: Cover?
}
