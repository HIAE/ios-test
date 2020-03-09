import XCTest
@testable import ChuckConsumer

class CategoriesSceneCreatorTests: XCTestCase {

    let sut = CategoriesSceneCreator.create()

    func testPresenterBindings() {
        let presenter = sut.presenter as? CategoriesPresenterHandler
        XCTAssertNotNil(presenter?.viewController)
        XCTAssertNotNil(presenter?.interactor)
    }

    func testInteractorBindings() {
        let presenter = sut.presenter as? CategoriesPresenterHandler
        let interactor = presenter?.interactor as? CategoriesInteractorInput
        XCTAssertNotNil(interactor?.responder)
    }

    func testRouterBindings() {
        let presenter = sut.presenter as? CategoriesPresenterHandler
        let router = presenter?.router as? CategoriesRouter
        XCTAssertNotNil(router?.viewController)
    }

}
