import UIKit
import SnapKit
import RxSwift
import RxCocoa

// MARK: - Login view controller class

final class LoginViewController: UIViewController {
    
    // MARK: - ViewModel
    
    private var viewModel: LoginViewModelProtocol?
    
    // MARK: - Configuration
    
    public func configure(with viewModel: LoginViewModelProtocol?) {
        self.viewModel = viewModel
    }
    
    // MARK: - Private properties
    
    private let bag = DisposeBag()
    
    // MARK: - UI
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.setupAppearance()
        textField.isEnabled = true
        textField.textColor = .white
        textField.textAlignment = .center
        textField.keyboardType = .asciiCapable
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardAppearance = .dark
        textField.returnKeyType = .done
        textField.placeholder = "_"
        textField.font = .monospacedSystemFont(ofSize: 20, weight: .medium)
        return textField
    }()
    
    private lazy var testLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.setupAppearance()
        label.font = UIFont.italicSystemFont(ofSize: 22)
        return label
    }()
    
    private lazy var increaseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(increaseTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var decreaseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(decreaseTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupRx()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setups
    
    private func setupView() {
        viewModel = LoginViewModel()
    }
    
    private func setupRx() {
        viewModel?.textLabel.subscribe(onNext: { [weak self] in
            self?.testLabel.text = $0
            print($0)
        }).disposed(by: bag)
        
        textField.rx.controlEvent(.editingDidEnd).subscribe(onNext: { [weak self] in
            self?.textFieldChanged()
        }).disposed(by: bag)
        
        textField.rx.controlEvent(.editingDidEndOnExit).subscribe(onNext: { [weak self] in
            self?.textFieldReturned()
        }).disposed(by: bag)
    }
    
    private func setupHierarchy() {
        view.addSubview(textField)
        view.addSubview(testLabel)
        view.addSubview(increaseButton)
        view.addSubview(decreaseButton)
    }
    
    private func setupLayout() {
        textField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(textField.snp.width).dividedBy(6)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().dividedBy(2)
        }
    
        testLabel.snp.makeConstraints { make in
            make.width.equalTo(textField)
            make.height.equalTo(textField).multipliedBy(2)
            make.centerX.equalToSuperview()
            make.top.equalTo(textField.snp.bottom).offset(40)
        }
        
        increaseButton.snp.makeConstraints { make in
            make.left.height.equalTo(testLabel)
            make.width.equalTo(testLabel).dividedBy(2)
            make.top.equalTo(testLabel.snp.bottom).offset(10)
        }
        
        decreaseButton.snp.makeConstraints { make in
            make.right.height.equalTo(testLabel)
            make.width.equalTo(testLabel).dividedBy(2)
            make.top.equalTo(testLabel.snp.bottom).offset(10)
        }
    }
    
    // MARK: - Actions
    
    private func textFieldReturned() {
        viewModel?.textFieldReturned(textField.text ?? "")
        textField.endEditing(true)
    }
    
    private func textFieldChanged() {
        viewModel?.textFieldReturned(textField.text ?? "")
    }
    
    @objc private func increaseTapped() {
        viewModel?.increaseTapped()
    }
    
    @objc private func decreaseTapped() {
        viewModel?.decreaseTapped()
    }
}

extension UIView {
    func setupAppearance() {
        self.layer.cornerRadius = 4
        self.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        self.layer.borderWidth = 2
    }
}
