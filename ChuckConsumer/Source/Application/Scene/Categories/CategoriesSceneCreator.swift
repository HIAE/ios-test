import Foundation

enum CategoriesSceneCreator {
    static func create() -> CategoriesViewController {
        let tableViewHandler = CategoriesTableViewDataHandler()
        let view = CategoriesViewController(tableViewHandler: tableViewHandler)

        return view
    }
}
