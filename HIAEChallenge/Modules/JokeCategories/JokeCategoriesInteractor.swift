//
//  JokeCategoriesInteractor.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 17/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

import RxSwift
import RxCocoa

final class JokeCategoriesInteractor: JokeCategoriesInteractorProtocol {
    weak var delegate: JokeCategoriesInteractorDelegate!

    let chuckNorisService = ChuckNorisService()
    let disposeBag = DisposeBag()

    func loadCategories() {
        let observable: Observable<[String]> = chuckNorisService.send(apiRequest: CategoriesRequest())

        observable.observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (categories) in
                    self?.delegate.handle(JokeCategoriesInteractorOutputs.sendData(categories: categories))

                }, onError: { [weak self] (error) in
                    self?.delegate.handle(JokeCategoriesInteractorOutputs.sendError("Error"))

                }, onCompleted: nil, onDisposed: nil)
        .disposed(by: disposeBag)

    }
}
