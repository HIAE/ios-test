import XCTest
@testable import ChuckConsumer

class JokeSceneCreatorTests: XCTestCase {

    let sut = JokeSceneCreator.create(category: Category(name: "Test"))

    func testPresenterBindings() {
        let presenter = sut.presenter as? JokePresenterHandler
        XCTAssertNotNil(presenter?.viewController)
        XCTAssertNotNil(presenter?.interactor)
        XCTAssertEqual(presenter?.category.name, "Test")
    }

    func testInteractorBindings() {
        let presenter = sut.presenter as? JokePresenterHandler
        let interactor = presenter?.interactor as? JokeInteractorInput
        XCTAssertNotNil(interactor?.responder)
    }

}
