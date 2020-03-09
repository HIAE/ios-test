import UIKit

final class CategoriesTableViewDataHandler: NSObject, CategoriesTableViewHandler,
        UITableViewDataSource, UITableViewDelegate {

    var onSelectCategory: ((Category, IndexPath) -> Void)?

    var categories: [Category] = [] {
        didSet {
            target?.reloadData()
        }
    }

    weak var target: UITableView? = nil {
        didSet {
            setupComponents()
            target?.delegate = self
            target?.dataSource = self
        }
    }

    override init() {
        super.init()
    }

    private func setupComponents() {
        let identifier = "CategoryCell"
        let nib = UINib(nibName: identifier, bundle: nil)
        target?.register(nib, forCellReuseIdentifier: identifier)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "CategoryCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                       for: indexPath) as? CategoryCell else {
            fatalError("Error on creating cell")
        }

        let category = categories[indexPath.row]
        cell.show(category: category)
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        onSelectCategory?(category, indexPath)
    }

}
