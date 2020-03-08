import Foundation

protocol CategoriesView: class {
    func show(categories: [Category])
}

protocol CategoriesPresenter: class {
    func getCategories()
}

protocol CategoriesInteractor: class {
    func fetchCategories()
}

protocol CategoriesInteractorResponder: class {
    func handle(categories: [Category])
    func handle(error: Error)
}

protocol CategoriesWireframe: class {
    func showJoke(category: String)
}
