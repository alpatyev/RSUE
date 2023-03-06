import Foundation
import UIKit

// MARK: - Constants

enum Constants {
    enum Colors {
        static let backgroundGray = UIColor(red: 0.96, green: 0.97, blue: 0.98, alpha: 1.00)
        static let backgroundWhite = UIColor.white
        static let black = UIColor.black
        static let corporate = UIColor(red: 0.11, green: 0.00, blue: 0.39, alpha: 1.00)
    }
    
    enum Fonts {
        static let descripton = UIFont.systemFont(ofSize: 16, weight: .thin)
        static let header = UIFont.boldSystemFont(ofSize: 24)
        static let monospaced = UIFont.monospacedSystemFont(ofSize: 16, weight: .regular)
        static let subheader = UIFont.boldSystemFont(ofSize: 20)
    }
    
    enum Layout {
        static let borderWidth: CGFloat = 1.25
        static let cornerRadius: CGFloat = 8
        static let indent: CGFloat = 36
        static let smallIndent: CGFloat = 12
    }
}
