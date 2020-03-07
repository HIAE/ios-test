protocol JokeService {
    func onSuccess(completion: @escaping (Joke) -> Void) -> Self
    func onError(completion: @escaping (Error) -> Void) -> Self
    func fetch(by category: String)
}
