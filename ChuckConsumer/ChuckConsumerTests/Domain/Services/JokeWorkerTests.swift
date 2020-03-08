import XCTest
@testable import ChuckConsumer

class JokeWorkerTests: XCTestCase {

    var sut: JokeWorker!
    var requestWorker: JokeWorkerRequestServiceMock!

    override func setUp() {
        requestWorker = JokeWorkerRequestServiceMock()
        sut = JokeWorker(with: requestWorker)
    }

    func testSuccess() {
        let expectation = XCTestExpectation()
        requestWorker.resultIsSuccess = true

        let expectedJoke = Joke(categories: nil, value: "ABCDE")

        sut.onSuccess { joke in
            XCTAssertEqual(joke, expectedJoke)
            expectation.fulfill()
        }

        sut.fetch(by: "Test")
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

        sut.fetch(by: "Test")
        wait(for: [expectation], timeout: 5.0)
    }
}

// =======
// HELPERS
// =======

class JokeWorkerRequestServiceMock: RequestService {

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
                            completion: completion as? ((Result<Joke, Error>) -> Void))

    }

    func requestStubbed<T>(_ type: T.Type,
                           from request: RequestModel,
                           additionalHeaders: HttpHeaders,
                           completion: ((Result<Joke, Error>) -> Void)?) where T: Decodable {

        if resultIsSuccess {
            let joke = Joke(categories: nil, value: "ABCDE")
            let result = Result<Joke, Error>.success(joke)
            completion?(result)
            return
        }

        let error = NSError(domain: "Not Found", code: 404, userInfo: nil)
        let result = Result<Joke, Error>.failure(error)
        completion?(result)
    }

}
