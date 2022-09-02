import Foundation

enum Notifications: String {

    case testNotification

    var name: Notification.Name {
        return Notification.Name(DataConfigs.appPrefix + "." + self.rawValue)
    }

    init?(name: Notification.Name) {
        if name.rawValue.contains(DataConfigs.appPrefix + ".") {
            let notificationRawValue = name.rawValue
                .replacingOccurrences(of: DataConfigs.appPrefix + ".", with: "")
                .trimmingCharacters(in: .whitespacesAndNewlines)
            self.init(rawValue: notificationRawValue)
        } else {
            return nil
        }
    }
}
