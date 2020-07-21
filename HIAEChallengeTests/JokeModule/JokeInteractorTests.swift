//
//  JokeInteractorTests.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 20/07/20.
//  Copyright (c) 2020 Vinicius Custodio. All rights reserved.
//

@testable import HIAEChallenge
import XCTest
import RxSwift
import RxTest

class JokeInteractorTests: XCTestCase {
    // MARK: Subject under test
    var subject: JokeInteractor!
    var delegate: MockInteractorDelegate!
    
    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        setupJokeInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupJokeInteractor() {
        subject = JokeInteractor()
        delegate = MockInteractorDelegate()
        
        subject.delegate = delegate
    }
    
    // MARK: Tests
    func testGetJokeSuccess() {
        let expectation = self.expectation(description: "APICall")
        delegate.expectation = expectation
        
        subject.getJoke(category: "dev")

        self.waitForExpectations(timeout: 15)

        XCTAssertNotNil((self.subject.delegate as? MockInteractorDelegate)?.joke)
    }
    
    func testGetJokeFail() {
        let expectation = self.expectation(description: "APICall")
        delegate.expectation = expectation
        
        subject.getJoke(category: "invalid_class")
        
        self.waitForExpectations(timeout: 15)
        
        XCTAssertNotNil((self.subject.delegate as? MockInteractorDelegate)?.error)
        
    }
}

class MockInteractorDelegate: JokeInteractorDelegate {
    var joke: Joke?
    var error: ChuckNorrisError?
    var expectation: XCTestExpectation?
    
    func handleJokeRetrieve(_ output: JokeInteractorOutputs) {
        switch output {
        case .sendError(let errorReturned):
            error = errorReturned
            expectation?.fulfill()
            
        case .sendData(let jokeReturned):
            joke = jokeReturned
            expectation?.fulfill()
        }
    }
    
    
}
