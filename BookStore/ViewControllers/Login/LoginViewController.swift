//
//  ViewController.swift
//  BookStore
//
//  Created by Abhishek Singh on 27/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var loaderView: NVActivityIndicatorView!

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var viewModel: LoginViewModel!
    private var activeTextField: UITextField!

    let bookCollectionSegueIdentifier = "openBookCollection"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        deRegisterKeyboardNotifications()
    }
    
    @IBAction func loginButtonClicked() {
        
        if !viewModel.allValid(userName: usernameTextField.text, password: passwordTextField.text) {
            self.showAlert(title: ErrorMessage.alertTitle.rawValue, message: LoginValidationMessages.error.rawValue)
            return
        }
        
        startLoading()
                                     // we can force cast here as all valid check is done
        self.viewModel.login(userName: usernameTextField.text!, password: passwordTextField.text!)
            .done { response in
                if response.success, let token = response.token {
                    self.viewModel.updateToken(token: token)
                    self.performSegue(withIdentifier: self.bookCollectionSegueIdentifier, sender: nil)
                }
            }.catch{ error in
                switch error {
                    case ApiError.authenicationFailure:
                        self.showAlert(title: ErrorMessage.alertTitle.rawValue, message: ErrorMessage.loginFailed.rawValue)
                    case ApiError.connectionFailure:
                        self.showAlert(title: ErrorMessage.alertTitle.rawValue, message: ErrorMessage.connectionError.rawValue)
                    default:
                        self.showAlert(title: ErrorMessage.alertTitle.rawValue, message: ErrorMessage.unexpectedError.rawValue)
                }
            }.finally {
                self.endLoading()
            }
    }
    @IBAction func loginButtonClicked2() {
        
        
        startLoading()
                                     // we can force cast here as all valid check is done
        self.viewModel.getTVShows()
            .done { response in
                print(response)
            }.catch{ error in
                switch error {
                    case ApiError.authenicationFailure:
                        self.showAlert(title: ErrorMessage.alertTitle.rawValue, message: ErrorMessage.loginFailed.rawValue)
                    case ApiError.connectionFailure:
                        self.showAlert(title: ErrorMessage.alertTitle.rawValue, message: ErrorMessage.connectionError.rawValue)
                    default:
                        self.showAlert(title: ErrorMessage.alertTitle.rawValue, message: ErrorMessage.unexpectedError.rawValue)
                }
            }.finally {
                self.endLoading()
            }
    }
    
    fileprivate func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    fileprivate func deRegisterKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc
    internal  func keyboardWillShow(notification: NSNotification) {
        if let activeTextField = activeTextField { // this method will get called even if a system generated alert with keyboard appears over the current VC.
            let info: NSDictionary = notification.userInfo! as NSDictionary
            let value: NSValue = info.value(forKey: UIResponder.keyboardFrameBeginUserInfoKey) as! NSValue
            let keyboardSize: CGSize = value.cgRectValue.size
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            scrollview.contentInset = contentInsets
            scrollview.scrollIndicatorInsets = contentInsets
            
            // If active text field is hidden by keyboard, scroll it so it's visible
            // Your app might not need or want this behavior.
            var aRect: CGRect = self.view.frame
            aRect.size.height -= keyboardSize.height
            let activeTextFieldRect: CGRect? = activeTextField.frame
            let activeTextFieldOrigin: CGPoint? = activeTextFieldRect?.origin
            if !aRect.contains(activeTextFieldOrigin!) {
                scrollview.scrollRectToVisible(activeTextFieldRect!, animated: true)
            }
        }
    }
    @objc
    internal func keyboardWillHide(notification: NSNotification) {
        let contentInsets: UIEdgeInsets = .zero
        scrollview.contentInset = contentInsets
        scrollview.scrollIndicatorInsets = contentInsets
    }
    
    private func startLoading() {
        self.view.isUserInteractionEnabled = false
        self.loginButton.isHidden = true
        self.loaderView.type = .ballPulse
        self.loaderView.color = BookStoreColor.greySeparator
        self.loaderView.startAnimating()
    }
    
    private func endLoading() {
        self.view.isUserInteractionEnabled = true
        self.loaderView.stopAnimating()
        self.loginButton.isHidden = false
    }

    //MARK: TextField Delegates
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    internal func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
        scrollview.isScrollEnabled = true
    }
    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        activeTextField = nil
    }
}

