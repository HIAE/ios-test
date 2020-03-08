import UIKit

final class CategoriesViewController: UIViewController, CategoriesView {

    @IBOutlet weak var tableView: UITableView!
    private var tableViewHandler: CategoriesTableViewHandler!

    init(tableViewHandler: CategoriesTableViewHandler) {
        let nibName = "CategoriesViewController"
        self.tableViewHandler = tableViewHandler
        super.init(nibName: nibName, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        tableViewHandler.target = tableView
    }

    func show(categories: [Category]) {
        tableViewHandler.categories = categories
    }
}
