//  
//  SampleRouter.swift
//

import UIKit

class SampleRouterFactory {
    
    func assembleModule() -> SampleViewController {
        let view = SampleViewController()
        let router = SampleRouterImpl(viewController: view)
        let entity = SampleEntity()
        let interactorDependency = SampleInteractorDependency()
        let interactor = SampleInteractorFactory().getSampleInteractor(
            entity: entity,
            dependency: interactorDependency
        )
        let presenterDependency = SamplePresenterDependency(
            view: view,
            interactor: interactor,
            router: router
        )
        let presenterData = SamplePresenterData()
        let presenter = SamplePresenterFactory().getSamplePresenter(
            presenterData: presenterData,
            dependency: presenterDependency
        )
        interactor.inject(presenter)
        view.inject(presenter)
        return view
    }
}

private class SampleRouterImpl {

    private weak var viewController: SampleViewController!

    init(viewController: SampleViewController) {
        self.viewController = viewController
    }
}

extension SampleRouterImpl: SampleRouter {
}
