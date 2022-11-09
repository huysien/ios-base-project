//  ___FILEHEADER___

import UIKit

final class ___FILEBASENAMEASIDENTIFIER___: UIViewController {

    private var presenter: ___VARIABLE_productName:identifier___Presenter!

    func inject(_ presenter: ___VARIABLE_productName:identifier___Presenter) {
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewDidLoad()
    }
}

extension ___FILEBASENAMEASIDENTIFIER___: ___VARIABLE_productName:identifier___View {

    func commonSetup() {
        // TODO: Setup view
    }
}
