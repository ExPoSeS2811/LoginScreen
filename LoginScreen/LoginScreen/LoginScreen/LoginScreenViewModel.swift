//
//  LoginScreenViewModel.swift
//  LoginScreen
//
//  Created by MacBook Pro 13 2019 on 4/10/23.
//

import Foundation

class LoginScreenViewModel {
    var enteredEmail: String = ""
    var enteredPassword: String = ""
    
    let mockEmail = "abc@gmail.com"
    let mockPassword = "Qwerty12345"
    
    func check(email: String) -> Bool {
        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailPattern)
        return emailPredicate.evaluate(with: email)
    }
    
    func check(password: String) -> Bool {
        let passwordPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d]{8,20}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordPattern)
        return passwordPredicate.evaluate(with: password)
    }
}
