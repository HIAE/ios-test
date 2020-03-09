protocol CategoryService {
    @discardableResult func onSuccess(completion: @escaping ([Category]) -> Void) -> Self
    @discardableResult func onError(completion: @escaping (Error) -> Void) -> Self
    func fetch()
}
