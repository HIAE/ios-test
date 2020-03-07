protocol CategoryService {
    func onSuccess(completion: @escaping ([Category]) -> Void) -> Self
    func onError(completion: @escaping (Error) -> Void) -> Self
    func fetch()
}
