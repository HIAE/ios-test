import Foundation

protocol JokeView: class {
    func show(joke: Joke)
}

protocol JokePresenter: class {
    func getJoke()
}

protocol JokeInteractor: class {
    func fetchJoke(category: Category)
}

protocol JokeInteractorResponder: class {
    func handle(joke: Joke)
    func handle(error: Error)
}
