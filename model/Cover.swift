
import Foundation

struct Cover: Decodable {
    let width, height: Int?
    let url: String?
    let medium, thumbnail: Medium?
}
