import SwiftUI

extension Color {
    static let ozSun    = Color(red: 0.98, green: 0.60, blue: 0.15)
    static let ozOchre  = Color(red: 0.78, green: 0.22, blue: 0.13)
    static let ozGold   = Color(red: 0.96, green: 0.80, blue: 0.20)
    static let ozTeal   = Color(red: 0.06, green: 0.53, blue: 0.51)
    static let ozIndigo = Color(red: 0.10, green: 0.25, blue: 0.45)
    static let ozBackground = Color(red: 1.0, green: 0.9647, blue: 0.9294) // #ECA45C
}

extension DateFormatter {
    static let ozLong: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .short
        return df
    }()
}
