import XCTest
@testable import ChuckConsumer

class CategoryWorkerTests: XCTestCase {

    var sut: CategoryWorker!
    var requestWorker: CategoryWorkerRequestServiceMock!

    override func setUp() {
        requestWorker = CategoryWorkerRequestServiceMock()
        sut = CategoryWorker(with: requestWorker)
    }

    func testSuccess() {
        let expectation = XCTestExpectation()
        requestWorker.resultIsSuccess = true

        let expectedElements = [
            Category(name: "A"),
            Category(name: "B"),
            Category(name: "C"),
            Category(name: "D")
        ]

        sut.onSuccess { categories in
            XCTAssertEqual(categories, expectedElements)
            expectation.fulfill()
        }

        sut.fetch()
        wait(for: [expectation], timeout: 5.0)
    }

    func testFail() {
        let expectation = XCTestExpectation()
        requestWorker.resultIsSuccess = false

        sut.onError { error in
            let err = error as NSError
            XCTAssertEqual(err.code, 404)
            XCTAssertEqual(err.domain, "Not Found")
            expectation.fulfill()
        }

        sut.fetch()
        wait(for: [expectation], timeout: 5.0)
    }
}

// =======
// HELPERS
// =======

class CategoryWorkerRequestServiceMock: RequestService {

    var resultIsSuccess = true

    func requestData(from request: RequestModel, additionalHeaders: HttpHeaders, completion: HttpCompletion?) {
        return
    }

    func request<T>(_ type: T.Type,
                    from request: RequestModel,
                    additionalHeaders: HttpHeaders,
                    completion: ((Result<T, Error>) -> Void)?) where T: Decodable {

        self.requestStubbed([String].self,
                            from: request,
                            additionalHeaders: additionalHeaders,
                            completion: completion as? ((Result<[String], Error>) -> Void))

    }

    func requestStubbed<T>(_ type: T.Type,
                           from request: RequestModel,
                           additionalHeaders: HttpHeaders,
                           completion: ((Result<[String], Error>) -> Void)?) where T: Decodable {

        if resultIsSuccess {
            let array = ["A", "B", "C", "D"]
            let result = Result<[String], Error>.success(array)
            completion?(result)
            return
        }

        let error = NSError(domain: "Not Found", code: 404, userInfo: nil)
        let result = Result<[String], Error>.failure(error)
        completion?(result)
    }

}
