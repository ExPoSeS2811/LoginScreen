//
//  ViewController.swift
//  LoginScreen
//
//  Created by MacBook Pro 13 2019 on 4/6/23.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var signupDescriptionLabel: UILabel!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var bottomBorderMailView: UIView!
    @IBOutlet weak var bottomBorderPasswordView: UIView!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureButton()
    }
    
    // MARK: - IBActions
    @IBAction func loginButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func signupButtonAction(_ sender: UIButton) {
    }

    // MARK: - Methods
    private func configureButton() {
        // Add shadow
        loginButton.layer.shadowColor = UIColor.systemIndigo.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        loginButton.layer.shadowOpacity = 1
    }
}

