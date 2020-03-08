import UIKit

protocol CategoriesTableViewHandler: class {
    var categories: [Category] { get set }
    var target: UITableView? { get set }
    var onSelectCategory: ((Category, IndexPath) -> Void)? { get set }
}
