//
//  DetailViewController.swift
//  Challenge-Day50
//
//  Created by Bhargav Maniar on 05/06/2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textView: UITextView!
    var selectedImage: String?
    var selectedCaption: String?
    var selectedName: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedName! // Unwrapping required

        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        if let captionToLoad = selectedCaption {
            textView.text = captionToLoad
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

}
