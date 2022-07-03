//
//  ViewController.swift
//  2.3(Log in)
//
//  Created by Boris Alexandrov on 01.07.2022.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet var userText: UITextField!
    @IBOutlet var passwordText: UITextField!
    
    private let user = "Boris"
    private let password = "pass"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welView = segue.destination as? WelcomeViewController else { return }
        welView.name = user
    }
    
        
    @IBAction func logPress() {
        if userText.text != user || passwordText.text != password {
            alertUp(
                title: "Sorry you are not correct",
                message: "Will be correct",
                textField: passwordText
            )
        }
    }
    
    @IBAction func forgotUser(_ sender: UIButton) {
        alertUp(title: "Why?", message: "You name is \(user)")
    }
    
    @IBAction func forgotPass(_ sender: UIButton) {
        alertUp(title: "Why?", message: "You password is \(password)")
    }
    
    @IBAction func unwindSeg(seg: UIStoryboardSegue) {
        userText.text = ""
        passwordText.text = ""
    }
}

extension ViewController {
    private func alertUp(title: String, message: String, textField: UITextField? = nil) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let actionAlert = UIAlertAction(title: "OK", style: .default) { _ in
        (
            textField?.text = ""
            )
        }
    alert.addAction(actionAlert)
    present(alert, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userText {
            passwordText.becomeFirstResponder()
        } else {
            logPress()
            performSegue(withIdentifier: "showWelcome", sender: nil)
        }
        return true
    }
}
            


    


