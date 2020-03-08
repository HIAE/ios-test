import UIKit

protocol CategoriesTableViewHandler: class {
    var categories: [Category] { get set }
    var target: UITableView? { get set }
}
