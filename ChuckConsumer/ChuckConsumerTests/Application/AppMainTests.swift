import XCTest
@testable import ChuckConsumer

class AppMainTests: XCTestCase {

    var sut: AppMain!
    var window: UIWindow!

    override func setUp() {
        window = UIWindow()
    }

    func testRunSuccess() {
        sut = AppMain(using: window)
        let result = sut.run()

        XCTAssertTrue(result)

        XCTAssertNotNil(window.rootViewController)
        XCTAssertTrue(window.rootViewController! is UIViewController)
    }

    func testRunFail() {
        sut = AppMain(using: nil)
        let result = sut.run()

        XCTAssertFalse(result)
        XCTAssertNil(window.rootViewController)
    }

}
