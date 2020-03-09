protocol JokeService {
    @discardableResult func onSuccess(completion: @escaping (Joke) -> Void) -> Self
    @discardableResult func onError(completion: @escaping (Error) -> Void) -> Self
    func fetch(by category: String)
}
