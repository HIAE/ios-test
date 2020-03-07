import XCTest
@testable import ChuckConsumer

class RawServiceTests: XCTestCase {

    var sut: RawService!
    var mockedHttp: HttpService!

    func testSuccessRawData() {
        setupSut(response: .success, successData: TestModel.createStringModel())

        sut.requestData(from: Request()) { result in
            switch result {
            case .success(let resultData):
                XCTAssertEqual(resultData, TestModel.createStringModel().data(using: .utf8)!)
            default:
                XCTFail("This test was expecting a success result")
            }
        }
    }

    func testFailRawData() {
        setupSut(response: .error, successData: "")

        sut.requestData(from: Request()) { result in
            switch result {
            case .failure(let error as NSError):
                XCTAssertEqual(error.code, 404)
                XCTAssertEqual(error.domain, "Not Found")
                XCTAssertNotEqual(error.domain, "Not found")
            default:
                XCTFail("This test was expecting a fail result")
            }
        }
    }

    // -------------------------
    func setupSut(response: HttpMock.ResponseType, successData: String) {
        mockedHttp = HttpMock(responseType: response,
                              successData: TestModel.createStringModel())

        sut = RawService(http: mockedHttp)
    }
}

// --------------------------------------------------

// =======
// HELPERS
// =======

class HttpMock: HttpService {

    enum ResponseType {
        case success
        case error
    }

    var response: ResponseType
    var successData: String

    init(responseType: ResponseType, successData: String) {
        self.response = responseType
        self.successData = successData
    }

    func request(_ req: StandardRequest, additionalHeaders: HttpHeaders, completion: HttpCompletion?) {
        if response == .error {
            let error = NSError(domain: "Not Found", code: 404, userInfo: [:])
            completion?(.failure(error))
            return
        }

        let result = successData.data(using: .utf8)!
        completion?(.success(result))
    }

}

struct Request: StandardRequest {
    var url: String = ""
    var method: HttpMethod = .get
    var body: HttpBody?
    var headers: HttpHeaders = [:]
}

struct TestModel: Decodable {
    let dailyPhrase: String
    let value: Int

    static func createStringModel(phrase: String = "Test", value: Int = 12345) -> String {
        return "{\"daily_phrase\":\"\(phrase)\", \"value\": \(value)}"
    }
}
