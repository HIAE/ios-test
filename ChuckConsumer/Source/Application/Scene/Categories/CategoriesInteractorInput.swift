import Foundation

final class CategoriesInteractorInput: CategoriesInteractor {

    weak var responder: CategoriesInteractorResponder?
    private let service: CategoryService

    init(with service: CategoryService = CategoryWorker()) {
        self.service = service
        setupService()
    }

    private func setupService() {
        service.onSuccess { categories in
            self.responder?.handle(categories: categories)
        }
        .onError { error in
            self.responder?.handle(error: error)
        }
    }

    func fetchCategories() {
        service.fetch()
    }

}
