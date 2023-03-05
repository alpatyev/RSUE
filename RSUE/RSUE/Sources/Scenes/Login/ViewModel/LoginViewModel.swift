import Foundation
import RxSwift

// MARK: - Login view model protocol

protocol LoginViewModelProtocol {
    var textLabel: BehaviorSubject<String> { get }
    var textField: PublishSubject<String> { get }
    func increaseTapped()
    func decreaseTapped()
    func textFieldReturned(_ text: String)
}

// MARK: - Login view model

final class LoginViewModel: LoginViewModelProtocol {
    
    // MARK: - Models
    
    private var model: LoginModel {
        didSet {
            textLabel.onNext(model.line)
        }
    }
    
    // MARK: - Public properties
    
    var textLabel = BehaviorSubject<String>(value: "type something")
    var textField = PublishSubject<String>()
    
    // MARK: - Private properties
    
    private let bag = DisposeBag()
    
    // MARK: - Common Init
    
    init() {
        model = LoginModel()
    }
    
    // MARK: - Setups
    
    private func setupRx() {}
    
    // MARK: - Public methods
    
    func increaseTapped() {
        model.count += 1
    }
    
    func decreaseTapped() {
        if model.count > 0 {
            model.count -= 1
        }
    }
    
    func textFieldReturned(_ text: String) {
        model.textField = text
    }
    
    // MARK: - Private methods
    
}
