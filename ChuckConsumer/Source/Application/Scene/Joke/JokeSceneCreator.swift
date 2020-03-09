import Foundation

enum JokeSceneCreator {
    static func create(category: Category) -> JokeViewController {
        let interactor = JokeInteractorInput()
        let presenter = JokePresenterHandler(category: category, interactor: interactor)
        let viewController = JokeViewController(presenter: presenter)

        presenter.viewController = viewController
        interactor.responder = presenter
        return viewController
    }
}
