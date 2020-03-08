import Foundation

struct Joke: Decodable, Equatable {
    var categories: [Category]?
    var value: String?
}
