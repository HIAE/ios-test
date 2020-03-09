import Foundation

enum CategoriesSceneCreator {
    static func create() -> CategoriesViewController {
        let router = CategoriesRouter()
        let interactor = CategoriesInteractorInput()
        let presenter = CategoriesPresenterHandler(interactor: interactor, router: router)
        let view = CategoriesViewController(presenter: presenter)

        presenter.viewController = view
        interactor.responder = presenter
        router.viewController = view

        return view
    }
}
