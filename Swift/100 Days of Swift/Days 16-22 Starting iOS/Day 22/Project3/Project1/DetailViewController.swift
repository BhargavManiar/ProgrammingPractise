//
//  DetailViewController.swift
//  Project1
//
//  Created by Bhargav Maniar on 12/05/2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var selectedImagePosition: Int?
    var totalNumberOfImages: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Picture \(String(describing: selectedImagePosition!)) of \(String(describing: totalNumberOfImages!))" // Unwrapping required
        
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
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
