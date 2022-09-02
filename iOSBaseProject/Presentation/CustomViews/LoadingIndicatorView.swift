import UIKit

class LoadingViewIndicator {

    static let animationTime = 0.25
    static let overlayAlpha: CGFloat = 0.3
    static var currentView: UIView?

    static func show() {
        guard let currentMainWindow = UIApplication.shared.windows.first else {
            return
        }
        show(overlayTarget: currentMainWindow)
    }

    static func show(overlayTarget: UIView) {
        if currentView?.superview == overlayTarget {
            return
        }
        hide()
        let overlay = UIView()
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlayTarget.bringSubviewToFront(overlay)
        overlayTarget.addSubview(overlay)
        NSLayoutConstraint.activate([
            overlayTarget.leadingAnchor.constraint(equalTo: overlay.leadingAnchor),
            overlayTarget.trailingAnchor.constraint(equalTo: overlay.trailingAnchor),
            overlayTarget.topAnchor.constraint(equalTo: overlay.topAnchor),
            overlayTarget.bottomAnchor.constraint(equalTo: overlay.bottomAnchor)
        ])
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .gray
        indicator.backgroundColor = .white
        let indicatorTotalMargin: CGFloat = 10
        let indicatorWidth = indicator.bounds.width + indicatorTotalMargin
        indicator.layer.masksToBounds = true
        indicator.layer.cornerRadius = indicatorWidth / 2
        overlay.addSubview(indicator)
        NSLayoutConstraint.activate([
            overlay.centerXAnchor.constraint(equalTo: indicator.centerXAnchor),
            overlay.centerYAnchor.constraint(equalTo: indicator.centerYAnchor),
            indicator.widthAnchor.constraint(equalToConstant: indicatorWidth),
            indicator.heightAnchor.constraint(equalTo: indicator.widthAnchor)
        ])
        indicator.startAnimating()
        overlay.backgroundColor = UIColor.gray.withAlphaComponent(overlayAlpha)
        currentView = overlay
    }

    static func hide() {
        guard let view = currentView else {
            return
        }
        view.removeFromSuperview()
        currentView = nil
    }
}

