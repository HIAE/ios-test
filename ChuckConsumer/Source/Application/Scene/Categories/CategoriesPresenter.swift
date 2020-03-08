import Foundation

final class CategoriesPresenterHandler: CategoriesPresenter, CategoriesInteractorResponder {

    weak var viewController: CategoriesView?
    let interactor: CategoriesInteractor
    let router: CategoriesWireframe

    init(interactor: CategoriesInteractor, router: CategoriesWireframe) {
        self.interactor = interactor
        self.router = router
    }

    func getCategories() {
        interactor.fetchCategories()
    }

    func show(category: Category) {
        router.showJoke(category: category)
    }

    func handle(categories: [Category]) {
        viewController?.show(categories: categories)
    }

    func handle(error: Error) {
        return
    }
}
