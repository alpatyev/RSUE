import Foundation

// MARK: - Login model

struct LoginModel {
    var line: String {
        if textField.isEmpty {
            return "type something"
        } else {
            if count == 0 {
                return "0"
            } else {
                return "\(count) - \(textField)"
            }
        }
    }
    
    var count = Int()
    var textField = String()
}

