import Foundation

protocol SampleView: AnyObject {

    func commonSetup()
}

protocol SamplePresenter: SampleInteractorOutput {

    func onViewDidLoad()
}

protocol SampleRouter {
}

protocol SampleInteractor: AnyObject {
    
    func inject(_ output: SampleInteractorOutput)
}

protocol SampleInteractorOutput: AnyObject {
}
