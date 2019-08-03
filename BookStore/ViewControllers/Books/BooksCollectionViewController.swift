//
//  BooksCollectionViewController.swift
//  BookStore
//
//  Created by Abhishek Singh on 31/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import UIKit
import Floaty

class BooksCollectionViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var bookStoreTableView: UITableView!
    @IBOutlet weak var createButton: Floaty!

    var viewModel: BooksCollectionViewModel!

    fileprivate var books = [Book]() {
        didSet {
            bookStoreTableView.reloadData()
        }
    }
    
    let createBookSegueIdentifier = "createBook"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setTitle()
        setUpCreateButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.getBooks()
    }
    
    private func getBooks() {
        
        self.viewModel.getBooks()
            .addLoadingIndicator(viewController: self)
            .done { booksCollection in
                if booksCollection.count > 0 {
                    self.books = booksCollection
                } else {
                    self.showAlert(title: ErrorMessage.alertTitle.rawValue, message: ErrorMessage.unexpectedError.rawValue)
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
            }
    }
    
    private func setTitle() {
        self.title = "BOOKS"
    }
    
    private func setupTableView() {
        self.bookStoreTableView.backgroundColor = BookStoreColor.VerylightGreyBGColor
        self.bookStoreTableView.dataSource = self
        self.bookStoreTableView.register(SmallerImageTableCell.nib, forCellReuseIdentifier: SmallerImageTableCell.identifier)
        self.bookStoreTableView.register(WiderImageTableViewCell.nib, forCellReuseIdentifier: WiderImageTableViewCell.identifier)

        bookStoreTableView.tableFooterView = UIView() // to hide the empty cells at the bottom
        bookStoreTableView.dataSource = self
        bookStoreTableView.estimatedRowHeight = 300
        bookStoreTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setUpCreateButton() {
        createButton.addItem(title: "Create New Book", handler: { item in
            self.performSegue(withIdentifier: self.createBookSegueIdentifier, sender: nil)
            self.createButton.close()
        })
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let row = indexPath.row
        let book = books[row]
       
        if row == 0 || row % 2 == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SmallerImageTableCell.identifier) as? SmallerImageTableCell else { fatalError("Cannot get reusable cell " + SmallerImageTableCell.identifier)}
            cell.item = book
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WiderImageTableViewCell.identifier) as? WiderImageTableViewCell else { fatalError("Cannot get reusable cell " + WiderImageTableViewCell.identifier)}
            cell.item = book
            return cell
        }
    }
}
