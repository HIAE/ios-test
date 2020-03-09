import Foundation

class JokePresenterHandler: JokePresenter, JokeInteractorResponder {

    weak var viewController: JokeView?
    let interactor: JokeInteractor
    let category: Category

    init(category: Category, interactor: JokeInteractor) {
        self.category = category
        self.interactor = interactor
    }

    func getJoke() {
        interactor.fetchJoke(category: category)
    }

    func handle(joke: Joke) {
        viewController?.show(joke: joke)
    }

    func handle(error: Error) {
        return
    }

}
