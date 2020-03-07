final class CategoryWorker: CategoryService {

    let service: RequestService

    private var successCompletion: (([Category]) -> Void)?
    private var errorCompletion: ((Error) -> Void)?

    init(with service: RequestService = RequestWorker()) {
        self.service = service
    }

    func onSuccess(completion: @escaping ([Category]) -> Void) -> Self {
        successCompletion = completion
        return self
    }

    func onError(completion: @escaping (Error) -> Void) -> Self {
        errorCompletion = completion
        return self
    }

    func fetch() {
        let request = ServiceRequest(url: "https://api.chucknorris.io/jokes/categories",
                                     method: .get,
                                     body: nil,
                                     headers: [:])

        service.request([String].self, from: request, additionalHeaders: [:]) { [weak self] result in
            switch result {
            case .success(let resultCategories):
                 let categories = resultCategories.map { Category(name: $0) }
                 self?.successCompletion?(categories)

            case .failure(let error):
                self?.errorCompletion?(error)
            }
        }
    }
}
