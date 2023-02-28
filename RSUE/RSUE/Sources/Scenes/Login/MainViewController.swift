import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var logo: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray.withAlphaComponent(0.2)
        return imageView
    }()
    
    private lazy var usernameTextfield: UITextField = {
        let texfield = UITextField()
        texfield.layer.cornerRadius = 12
        texfield.layer.borderWidth = 1.5
        texfield.layer.borderColor = UIColor.label.cgColor
        return texfield
    }()
    
    private lazy var passswordTextfield: UITextField = {
        let texfield = UITextField()
        texfield.layer.cornerRadius = 12
        texfield.layer.borderWidth = 1.5
        texfield.layer.borderColor = UIColor.label.cgColor
        return texfield
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    private func setupHierarchy() {
        view.addSubview(logo)
        view.addSubview(usernameTextfield)
        view.addSubview(passswordTextfield)
    }
    
    private func setupLayout() {
        logo.snp.makeConstraints {
            
        }
    }
}
