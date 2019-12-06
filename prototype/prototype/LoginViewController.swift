//
//  LoginViewController.swift
//  prototype
//
//  Created by Developer on 11/5/19.
//  Copyright © 2019 CS Seniors. All rights reserved.
//
// TODO: sync the three versions. Use this one to update the master, and take from Patrick's computer
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBOutlet weak var loginText: UILabel!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var atBcLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var goToVote: Bool?
    var submitted: Bool?
    var resultsReady: Bool?
    
    var username: String?
    // MARK: View Setup
    override func viewDidLoad() {
        super.viewDidLoad()

        loginText.text = "Enter your username"
        self.emailText.placeholder = "username"
        emailText.becomeFirstResponder()
        self.emailText.delegate = self
        backButton.isEnabled = false
        backButton.isHidden = true
        goToVote = false
        submitted = false
        resultsReady = false
        emailText.keyboardAppearance = .dark
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
//        let gradient = CAGradientLayer()
//        gradient.frame = self.view.bounds
//        gradient.colors = [UIColor(displayP3Red: 91.0/256.0, green: 6.0/256.0, blue: 0, alpha: 100), UIColor(displayP3Red: 1, green: 1, blue: 0, alpha: 100)]
//        self.view.layer.insertSublayer(gradient, at: 1)
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if loginText.text != "Enter your username" {
            emailText.resignFirstResponder()
            // MARK: Segue to Different View
            if resultsReady != true {
                if submitted != true {
                    if goToVote == true {
                        self.performSegue(withIdentifier: "LoginToVote", sender: self)
                    } else {
                        self.performSegue(withIdentifier: "LoginToNominate", sender: self)
                    }
                } else {
                    self.performSegue(withIdentifier: "AlreadySubmitted", sender: self)
                }
            } else {
                self.performSegue(withIdentifier: "LoginToResult", sender: self)
            }
            
        } else {
            username = emailText.text
            emailText.text = ""
            // Check email with Ravenzone
            loginText.text = "Enter your password"
            emailText.placeholder = "password"
            emailText.textContentType = .password
            emailText.returnKeyType = .continue
            emailText.keyboardType = .default
            emailText.isSecureTextEntry = true
            atBcLabel.text = ""
            backButton.isEnabled = true
            backButton.isHidden = false
        }
//        print(username ?? "Name not found")
        return true
    }
    
    @IBAction func goBack(_ sender: Any) {
        loginText.text = "Enter your username"
        self.emailText.placeholder = "username"
        emailText.becomeFirstResponder()
        self.emailText.delegate = self
        backButton.isEnabled = false
        backButton.isHidden = true
//        emailText.textContentType = .emailAddress
        emailText.returnKeyType = .next
        emailText.isSecureTextEntry = false
        atBcLabel.text = "@benedictine.edu"
        emailText.text = ""
    }
    /*
    // MARK: Check user and password
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
