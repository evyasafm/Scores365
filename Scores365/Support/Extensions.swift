import Foundation

extension Date {
    /// Midnight of the same calendar day in current calendar & locale
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
}
