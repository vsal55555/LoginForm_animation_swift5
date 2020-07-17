//
//  ViewController.swift
//  LoginForm_animation_swift5
//
//  Created by BSAL-MAC on 7/15/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(methodwhenKeyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(methodwhenKeyboardWillHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc func methodwhenKeyboardWillShow(notification: Notification) {
        UIView.animate(withDuration: 0.3, animations: {
            self.bottomConstraint.constant = 300
            self.view.layoutIfNeeded()//forces the view to update its layout immediately
        }) { (status) in
            debugPrint("Completion Method")
        }
        
        //self.topConstraint.constant = -100//this can be used to make top portion move too.
        //debugPrint("This method is called when keyboard is about to be shown")
    }
    //lets add animation to the view movement
    @objc func methodwhenKeyboardWillHide(notification: Notification) {
        self.bottomConstraint.constant = 0
        self.topConstraint.constant = 0
        //debugPrint("This method is called when keyboard is about to be hidden")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    @IBAction func clickedOnSignIn(_ sender: Any) {
        self.view.endEditing(true)
        UIView.animate(withDuration: 0.3, animations: {
        self.bottomConstraint.constant = 0
            self.view.layoutIfNeeded()
        }) { (status) in
            //call api to validate username and password entered by user.
        }
    }
    
}

