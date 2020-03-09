import Foundation

final class JokeInteractorInput: JokeInteractor {

    weak var responder: JokeInteractorResponder?
    private let service: JokeService

    init(with service: JokeService = JokeWorker()) {
        self.service = service
        setupService()
    }

    private func setupService() {
        service.onSuccess { joke in
            self.responder?.handle(joke: joke)
        }
        .onError { error in
            self.responder?.handle(error: error)
        }
    }

    func fetchJoke(category: Category) {
        guard let name = category.name else {
            let error = NSError(domain: "No category present", code: 700, userInfo: nil)
            responder?.handle(error: error)
            return
        }

        service.fetch(by: name)
    }

}
