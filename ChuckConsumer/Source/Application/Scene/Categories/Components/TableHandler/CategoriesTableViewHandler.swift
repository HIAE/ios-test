import UIKit

protocol CategoriesTableViewHandler {
    var categories: [Category] { get set }
    var target: UITableView? { get set }
}
