//
//  JokeInteractor.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 17/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

import RxSwift

final class JokeInteractor: JokeInteractorProtocol {
    weak var delegate: JokeInteractorDelegate!

    var chuckNorrisService:ServiceInterface = ChuckNorisService()
    let disposeBag = DisposeBag()

    func getJoke(category: String) {
        let observable:Observable<Joke> = chuckNorrisService.send(apiRequest: CategoryRandomJokeRequest(category: category))

        observable.subscribe(onNext: { [weak self] (object) in
                self?.delegate.handleJokeRetrieve(JokeInteractorOutputs.sendData(joke: object))

            }, onError: { [weak self] (error) in
                self?.delegate.handleJokeRetrieve(JokeInteractorOutputs.sendError(ChuckNorrisError.jokeError))
                
        }, onCompleted: nil, onDisposed: nil)
        .disposed(by: disposeBag)
    }
    
}
