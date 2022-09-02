import Foundation

class NotificationCenterGatewayFactory {

    func makeNotificationCenterGateway() -> NotificationCenterGateway {
        NotificationCenterGatewayImpl()
    }
}

/// @mockable
protocol NotificationCenterGateway {

    func addObserver(_ observer: Any, selector: Selector, name: NSNotification.Name?)
    func addObserver(_ observer: Any, selector: Selector, name: NSNotification.Name?, object: Any?)
    func addObserver(_ observer: Any, selector: Selector, names: [NSNotification.Name])
    func post(name: NSNotification.Name, object: Any?, userInfo: [AnyHashable: Any]?)
    func post(name: NSNotification.Name, object: Any?)
    func removeObserver(_ observer: Any)
}

private class NotificationCenterGatewayImpl: NotificationCenterGateway {

    private let notificationCenter: NotificationCenter = .default

    func addObserver(_ observer: Any, selector: Selector, name: NSNotification.Name?) {
        addObserver(observer, selector: selector, name: name, object: nil)
    }

    func addObserver(_ observer: Any, selector: Selector, name: NSNotification.Name?, object: Any?) {
        notificationCenter.addObserver(observer, selector: selector, name: name, object: object)
    }

    func addObserver(_ observer: Any, selector: Selector, names: [NSNotification.Name]) {
        for name in names {
            addObserver(observer, selector: selector, name: name)
        }
    }

    func post(name: NSNotification.Name, object: Any?, userInfo: [AnyHashable: Any]?) {
        notificationCenter.post(name: name, object: object, userInfo: userInfo)
    }

    func post(name: NSNotification.Name, object: Any?) {
        notificationCenter.post(name: name, object: object)
    }

    func removeObserver(_ observer: Any) {
        notificationCenter.removeObserver(observer)
    }
}
