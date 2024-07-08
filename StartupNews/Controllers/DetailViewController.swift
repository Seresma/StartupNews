//
//  DetailViewController.swift
//  StartupNews
//
//  Created by Admin on 08/07/2024.
//

import UIKit

class DetailViewController: UIViewController, CoordinatorDelegate {
    
    var selectedArticle: Article?
    

    @IBOutlet private weak var textViewContent: UITextView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var labelAuthor: UILabel!
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var labelDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConnectionsWrapper.sharedInstance.fetchImage(from: selectedArticle!.imageUrl) { image in
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
        
        labelTitle.setWordWrapping()
        labelAuthor.setWordWrapping()
        labelDate.setWordWrapping()
        
        labelTitle.text = selectedArticle?.title
        labelAuthor.text = selectedArticle?.author
        labelDate.text = "\(String(describing: selectedArticle!.date)) - \(String(describing: selectedArticle!.time))"
        textViewContent.text = selectedArticle?.content
    }
    
}
