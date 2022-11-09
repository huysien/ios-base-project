//  ___FILEHEADER___

import Foundation

protocol ___VARIABLE_productName:identifier___View: AnyObject {

    func commonSetup()
}

protocol ___VARIABLE_productName:identifier___Presenter: ___VARIABLE_productName:identifier___InteractorOutput {

    func onViewDidLoad()
}

protocol ___VARIABLE_productName:identifier___Router {
}

protocol ___VARIABLE_productName:identifier___Interactor: AnyObject {
    
    func inject(_ output: ___VARIABLE_productName:identifier___InteractorOutput)
}

protocol ___VARIABLE_productName:identifier___InteractorOutput: AnyObject {
}
