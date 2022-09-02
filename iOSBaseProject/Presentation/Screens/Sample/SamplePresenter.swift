import Foundation

struct SamplePresenterDependency {
    
    weak var view: SampleView!
    let interactor: SampleInteractor
    let router: SampleRouter
}

class SamplePresenterData {
}

class SamplePresenterFactory {
    
    func getSamplePresenter(
        presenterData: SamplePresenterData,
        dependency: SamplePresenterDependency
    ) -> SamplePresenter {
        SamplePresenterImpl(presenterData: presenterData, dependency: dependency)
    }
}

private class SamplePresenterImpl {

    private weak var view: SampleView!
    private let interactor: SampleInteractor
    private let router: SampleRouter
    private let presenterData: SamplePresenterData

    init(presenterData: SamplePresenterData,
         dependency: SamplePresenterDependency) {
        self.view = dependency.view
        self.interactor = dependency.interactor
        self.router = dependency.router
        self.presenterData = presenterData
    }
}

extension SamplePresenterImpl: SamplePresenter {

    func onViewDidLoad() {
        view.commonSetup()
    }
}

extension SamplePresenterImpl: SampleInteractorOutput {
}
