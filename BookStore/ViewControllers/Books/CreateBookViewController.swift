//
//  CreateBookViewController.swift
//  BookStore
//
//  Created by Abhishek Singh on 01/08/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class CreateBookViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var isbnTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var publisherTextField: UITextField!
    @IBOutlet weak var imgUrlTextField: UITextField!
    
    @IBOutlet weak var loaderView: NVActivityIndicatorView!
    
    @IBOutlet weak var createButton: UIButton!
    
    var viewModel: CreateBookViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTitle()
    }
    
    private func setTitle() {
        self.title = "CREATE BOOK"
    }
    
    // MARK: Create Book
    @IBAction func createBook() {
        if !self.viewModel.allValid(isbn: isbnTextField.text, title: titleTextField.text, author: authorTextField.text, publisher: publisherTextField.text, image: imgUrlTextField.text) {
            
            self.showAlert(title: ErrorMessage.alertTitle.rawValue, message: CreateBookValidationMessages.error.rawValue)
            return
        }
        
        startLoading()          // we can force cast here as all valid check is done
        self.viewModel.createBook(isbn: isbnTextField.text!, title: titleTextField.text!, author: authorTextField.text!, publisher: publisherTextField.text!, image: imgUrlTextField.text!)
            .done { response in
                if  response.success {
                    self.showAlert(title: "", message: CreateBookSuccessMessages.message.rawValue)
                } else {
                    self.showAlert(title: ErrorMessage.alertTitle.rawValue, message: response.message)
                }
            }.catch { error in
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
    
    // MARK: Loading methods
    private func startLoading() {
        self.view.isUserInteractionEnabled = false
        self.createButton.isHidden = true
        self.loaderView.type = .ballPulse
        self.loaderView.color = BookStoreColor.greySeparator
        self.loaderView.startAnimating()
    }
    
    private func endLoading() {
        self.view.isUserInteractionEnabled = true
        self.loaderView.stopAnimating()
        self.createButton.isHidden = false
    }
    
    //MARK: TextField Delegates
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
