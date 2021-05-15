//
//  DetailViewController.swift
//  Project3
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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
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
    
    @objc func shareTapped() { // The attribute @abjc makes our code visible to objective c based UIKit code
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No Image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image,selectedImage!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
