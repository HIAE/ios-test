import Foundation

struct Joke: Decodable {
    var categories: [Category]?
    var value: String?
}
