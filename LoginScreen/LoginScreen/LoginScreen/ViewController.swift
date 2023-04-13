//
//  ViewController.swift
//  LoginScreen
//
//  Created by MacBook Pro 13 2019 on 4/6/23.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var envelopImageView: UIImageView!
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var signupDescriptionLabel: UILabel!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var bottomBorderEmailView: UIView!
    @IBOutlet weak var bottomBorderPasswordView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Properties
    var loginScreenViewModel = LoginScreenViewModel()
    
    let colorInvalidEnteredData: UIColor = .red
    let colorValidEnteredData: UIColor = .systemGray
    let defaultColor: UIColor = (UIColor(named: "logo") ?? (.systemIndigo))
    let turnedOffColor: UIColor = .lightGray
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLoginButton()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.becomeFirstResponder()
    }
    
    // MARK: - IBActions
    @IBAction func loginButtonAction(_ sender: UIButton) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        if loginScreenViewModel.enteredEmail.isEmpty {
            errorTextField(textField: emailTextField)
        }
        
        if loginScreenViewModel.enteredPassword.isEmpty {
            errorTextField(textField: passwordTextField)
        }
        
        if loginScreenViewModel.enteredEmail == loginScreenViewModel.mockEmail,
           loginScreenViewModel.enteredPassword == loginScreenViewModel.mockPassword {
            performSegue(withIdentifier: "goToHomePage", sender: sender)
        } else {
            showErrorAlert()
        }
    }
    
    @IBAction func signupButtonAction(_ sender: UIButton) {
        print("signup")
    }
    
    // MARK: - Methods
    private func setupLoginButton() {
        // Add shadow
        loginButton.layer.shadowColor = defaultColor.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        loginButton.layer.shadowOpacity = 1
        loginButton.layer.shadowRadius = 4
        
        loginButton.isUserInteractionEnabled = false
        loginButton.backgroundColor = colorValidEnteredData
    }
    
    private func errorTextField(textField: UITextField) {
        switch textField {
        case emailTextField:
            bottomBorderEmailView.backgroundColor = colorInvalidEnteredData
            envelopImageView.tintColor = colorInvalidEnteredData
        case passwordTextField:
            bottomBorderPasswordView.backgroundColor = colorInvalidEnteredData
            lockImageView.tintColor = colorInvalidEnteredData
        default:
            print("Unknown TextField")
        }
    }
    
    private func showErrorAlert() {
        let alertController = UIAlertController(title: "Error".localized,
                                                message: "Wrong email address or password".localized,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK".localized, style: .default))
        present(alertController, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !text.isEmpty else { return }
        
        switch textField {
        case emailTextField:
            let isValidEmail = loginScreenViewModel.check(email: text)
            
            if isValidEmail {
                loginScreenViewModel.enteredEmail = text
                bottomBorderEmailView.backgroundColor = colorValidEnteredData
                envelopImageView.tintColor = colorValidEnteredData
            } else {
                loginScreenViewModel.enteredEmail = ""
                errorTextField(textField: textField)
            }
        case passwordTextField:
            let isValidPassword = loginScreenViewModel.check(password: text)
            
            if isValidPassword {
                loginScreenViewModel.enteredPassword = text
                bottomBorderPasswordView.backgroundColor = colorValidEnteredData
                lockImageView.tintColor = colorValidEnteredData
            } else {
                loginScreenViewModel.enteredPassword = ""
                errorTextField(textField: textField)
            }
        default:
            print("Unknown")
        }
        
        let isEmptyEmailAndPassword =  (loginScreenViewModel.enteredEmail.isEmpty || loginScreenViewModel.enteredPassword.isEmpty)
        loginButton.isUserInteractionEnabled = !isEmptyEmailAndPassword
        loginButton.backgroundColor = !isEmptyEmailAndPassword ? defaultColor : colorValidEnteredData
    }
}

/*
 "Error" = "Ошибка"
 "Wrong email address or password" = "Неправильный адрес электронной почты или пароль"
 "OK" = "OK"
 */
