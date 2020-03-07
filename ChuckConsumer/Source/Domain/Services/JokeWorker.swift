final class JokeWorker: JokeService {

    let service: RequestService

    private var successCompletion: ((Joke) -> Void)?
    private var errorCompletion: ((Error) -> Void)?

    init(with service: RequestService = RequestWorker()) {
        self.service = service
    }

    func onSuccess(completion: @escaping (Joke) -> Void) -> Self {
        successCompletion = completion
        return self
    }

    func onError(completion: @escaping (Error) -> Void) -> Self {
        errorCompletion = completion
        return self
    }

    func fetch(by category: String) {
        let request = ServiceRequest(url: "https://api.chucknorris.io/jokes/random?category=\(category)",
                                     method: .get,
                                     body: nil,
                                     headers: [:])

        service.request(Joke.self, from: request, additionalHeaders: [:]) { [weak self] result in
            switch result {
            case .success(let joke):
                 self?.successCompletion?(joke)

            case .failure(let error):
                self?.errorCompletion?(error)
            }
        }
    }
}
