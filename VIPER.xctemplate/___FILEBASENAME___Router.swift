//  ___FILEHEADER___

import UIKit

class ___FILEBASENAMEASIDENTIFIER___Factory {
    
    func assembleModule() -> ___VARIABLE_productName:identifier___ViewController {
        let view = ___VARIABLE_productName:identifier___ViewController()
        let router = ___VARIABLE_productName:identifier___RouterImpl(viewController: view)
        let entity = ___VARIABLE_productName:identifier___Entity()
        let interactorDependency = ___VARIABLE_productName:identifier___InteractorDependency()
        let interactor = ___VARIABLE_productName:identifier___InteractorFactory().get___VARIABLE_productName:identifier___Interactor(
            entity: entity,
            dependency: interactorDependency
        )
        let presenterDependency = ___VARIABLE_productName:identifier___PresenterDependency(
            view: view,
            interactor: interactor,
            router: router
        )
        let presenterData = ___VARIABLE_productName:identifier___PresenterData()
        let presenter = ___VARIABLE_productName:identifier___PresenterFactory().get___VARIABLE_productName:identifier___Presenter(
            presenterData: presenterData,
            dependency: presenterDependency
        )
        interactor.inject(presenter)
        view.inject(presenter)
        return view
    }
}

private class ___FILEBASENAMEASIDENTIFIER___Impl {

    private weak var viewController: ___VARIABLE_productName:identifier___ViewController!

    init(viewController: ___VARIABLE_productName:identifier___ViewController) {
        self.viewController = viewController
    }
}

extension ___FILEBASENAMEASIDENTIFIER___Impl: ___FILEBASENAMEASIDENTIFIER___ {
}
