//  ___FILEHEADER___

import Foundation

struct ___FILEBASENAMEASIDENTIFIER___Dependency {
    
    weak var view: ___VARIABLE_productName:identifier___View!
    let interactor: ___VARIABLE_productName:identifier___Interactor
    let router: ___VARIABLE_productName:identifier___Router
}

class ___FILEBASENAMEASIDENTIFIER___Data {
}

class ___FILEBASENAMEASIDENTIFIER___Factory {
    
    func get___FILEBASENAMEASIDENTIFIER___(
        presenterData: ___FILEBASENAMEASIDENTIFIER___Data,
        dependency: ___FILEBASENAMEASIDENTIFIER___Dependency
    ) -> ___FILEBASENAMEASIDENTIFIER___ {
        ___FILEBASENAMEASIDENTIFIER___Impl(presenterData: presenterData, dependency: dependency)
    }
}

private class ___FILEBASENAMEASIDENTIFIER___Impl {

    private weak var view: ___VARIABLE_productName:identifier___View!
    private let interactor: ___VARIABLE_productName:identifier___Interactor
    private let router: ___VARIABLE_productName:identifier___Router
    private let presenterData: ___FILEBASENAMEASIDENTIFIER___Data

    init(presenterData: ___FILEBASENAMEASIDENTIFIER___Data,
         dependency: ___FILEBASENAMEASIDENTIFIER___Dependency) {
        self.view = dependency.view
        self.interactor = dependency.interactor
        self.router = dependency.router
        self.presenterData = presenterData
    }
}

extension ___FILEBASENAMEASIDENTIFIER___Impl: ___FILEBASENAMEASIDENTIFIER___ {

    func onViewDidLoad() {
        view.commonSetup()
    }
}

extension ___FILEBASENAMEASIDENTIFIER___Impl: ___VARIABLE_productName:identifier___InteractorOutput {
}
