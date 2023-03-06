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
        stack.backgroundColor = .gray.withAlphaComponent(0.45)
        return stack
    }()
    
    private lazy var headerImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    // MARK: - UI login stack
    
    private lazy var loginStack: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .gray.withAlphaComponent(0.35)
        return stack
    }()
    
    // MARK: - UI bottom stack

    private lazy var bottomStack: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .gray.withAlphaComponent(0.25)
        return stack
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
        view.addSubview(loginStack)
        view.addSubview(bottomStack)
    }
    
    private func setupLayout() {
        headerStack.snp.makeConstraints { make in
            make.top.left.right.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view.snp.height).dividedBy(3)
        }
        
        loginStack.snp.makeConstraints { make in
            make.top.equalTo(headerStack.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(bottomStack.snp.top)
        }
        
        bottomStack.snp.makeConstraints { make in
            make.height.equalTo(view.snp.height).dividedBy(3)
            make.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    // MARK: - Actions
    
}
