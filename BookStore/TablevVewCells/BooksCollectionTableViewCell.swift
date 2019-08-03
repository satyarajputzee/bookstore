//
//  BooksCollectionTableViewCell.swift
//  BookStore
//
//  Created by Abhishek Singh on 01/08/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import UIKit

class BooksCollectionTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: BookStoreTitleLabel!
    @IBOutlet weak var authorLabel: BookStoreSubtitleLabel!
    @IBOutlet weak var pictureImageView: UIImageView!
    
    var item: Book? {
        didSet {
            guard let item = item else {
                return
            }
            titleLabel.text = item.title
            authorLabel.text = item.author
            if let url = URL(string: item.image) {
                pictureImageView.af_setImage(withURL: url)
            }
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pictureImageView.clipsToBounds = true
        pictureImageView.contentMode = .scaleAspectFit
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pictureImageView.image = nil
    }

}
