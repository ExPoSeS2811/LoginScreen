//
//  ViewController.swift
//  LoginScreen
//
//  Created by MacBook Pro 13 2019 on 4/6/23.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureButton()
    }

    // MARK: - Methods
    private func configureButton() {
        // Add shadow
        loginButton.layer.shadowColor = UIColor.systemIndigo.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        loginButton.layer.shadowOpacity = 1
    }
}

