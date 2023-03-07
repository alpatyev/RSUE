import UIKit
import SnapKit
import RxSwift
import RxCocoa

// MARK: - Login view controller class

final class LoginViewController: UIViewController {
    
    // MARK: - ViewModel
    
    private var viewModel: LoginViewModelProtocol?
    
    // MARK: - Configuration
    
    // MARK: - UI top stack
    
    private lazy  var headerStack: UIStackView = {
        let stack = UIStackView()
        return stack
    }()
    
    private lazy var logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - UI login stack
    
    private lazy var loginStack: UIStackView = {
        let stack = UIStackView()
        return stack
    }()
    
    private lazy var loginInput: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = Constants.Layout.cornerRadius
        textField.layer.borderWidth = Constants.Layout.borderWidth
        textField.layer.borderColor = Constants.Colors.corporate.cgColor
        textField.textColor = Constants.Colors.black
        textField.placeholder = "Введите имя"
        textField.textAlignment = .center
        return textField
    }()
    
    private lazy var passwordInput: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = Constants.Layout.cornerRadius
        textField.layer.borderWidth = Constants.Layout.borderWidth
        textField.layer.borderColor = Constants.Colors.corporate.cgColor
        textField.textColor = Constants.Colors.black
        textField.placeholder = "Введите пароль"
        textField.textAlignment = .center
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = Constants.Layout.cornerRadius
        button.backgroundColor = Constants.Colors.corporate
        button.setTitleColor(Constants.Colors.backgroundWhite,
                             for: .normal)
        button.setTitle("Войти", for: .normal)
        return button
    }()
    
    // MARK: - UI bottom stack

    private lazy var bottomStack: UIStackView = {
        let stack = UIStackView()
        return stack
    }()
    
    private lazy var forgotButton: UIButton = {
        let button = UIButton()
        button.setTitle("Забыли пароль или логин?", for: .normal)
        button.setTitleColor(Constants.Colors.corporate, for: .normal)
        button.titleLabel?.font = Constants.Fonts.descripton
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setups
        
    private func setupView() {
        view.backgroundColor = Constants.Colors.backgroundWhite
    }
    
    private func setupHierarchy() {
        view.addSubview(headerStack)
        headerStack.addSubview(logo)
        
        view.addSubview(loginStack)
        loginStack.addSubview(loginInput)
        loginStack.addSubview(passwordInput)
        loginStack.addSubview(loginButton)
        
        view.addSubview(bottomStack)
        bottomStack.addSubview(forgotButton)
    }
    
    private func setupLayout() {
        headerStack.snp.makeConstraints { make in
            make.top.left.right.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view.snp.height).dividedBy(3)
        }
        
        logo.snp.makeConstraints { make in
            make.size.equalToSuperview().multipliedBy(0.5)
            make.center.equalToSuperview()
        }
        
        loginStack.snp.makeConstraints { make in
            make.top.equalTo(headerStack.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(bottomStack.snp.top)
        }
        
        loginInput.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(Constants.Layout.defaultHeight)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(Constants.Layout.indent)
        }
        
        passwordInput.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(Constants.Layout.defaultHeight)
            make.centerX.equalToSuperview()
            make.top.equalTo(loginInput.snp.bottom).offset(Constants.Layout.indent)
        }
        
        loginButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(Constants.Layout.defaultHeight)
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordInput.snp.bottom).offset(Constants.Layout.indent)
        }
        
        bottomStack.snp.makeConstraints { make in
            make.height.equalTo(view.snp.height).dividedBy(3)
            make.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        forgotButton.snp.makeConstraints { make in
            make.size.centerX.equalTo(loginButton)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(Constants.Layout.indent)
        }
    }
    
    // MARK: - Actions
    
}
