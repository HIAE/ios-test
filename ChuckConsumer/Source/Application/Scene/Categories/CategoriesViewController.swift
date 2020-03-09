import UIKit

final class CategoriesViewController: UIViewController, CategoriesView {

    @IBOutlet weak var tableView: UITableView!

    private let tableViewHandler: CategoriesTableViewHandler
    private let presenter: CategoriesPresenter

    init(presenter: CategoriesPresenter,
         tableViewHandler: CategoriesTableViewHandler = CategoriesTableViewDataHandler()) {

        let nibName = "CategoriesViewController"
        self.tableViewHandler = tableViewHandler
        self.presenter = presenter
        super.init(nibName: nibName, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter.getCategories()
    }

    func setup() {
        tableViewHandler.target = tableView

        tableViewHandler.onSelectCategory = { category, _ in
            self.presenter.show(category: category)
        }
    }

    func show(categories: [Category]) {
        DispatchQueue.main.async { [weak self] in
            self?.tableViewHandler.categories = categories
        }
    }
}
