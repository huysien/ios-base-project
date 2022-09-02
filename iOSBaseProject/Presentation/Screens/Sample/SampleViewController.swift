import UIKit

final class SampleViewController: UIViewController {

    private var presenter: SamplePresenter!

    func inject(_ presenter: SamplePresenter) {
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewDidLoad()
    }
}

extension SampleViewController: SampleView {

    func commonSetup() {
        // TODO: Setup view
    }
}
