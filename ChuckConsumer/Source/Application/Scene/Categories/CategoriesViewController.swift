import UIKit

final class CategoriesViewController: UIViewController, CategoriesView {

    @IBOutlet weak var tableView: UITableView!

    let tableViewHandler: CategoriesTableViewHandler
    let presenter: CategoriesPresenter

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
        bindComponents()
        presenter.getCategories()
    }

    func bindComponents() {
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
