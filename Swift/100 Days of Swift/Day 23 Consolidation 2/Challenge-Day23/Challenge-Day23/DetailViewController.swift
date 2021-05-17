//
//  DetailViewController.swift
//  Challenge-Day23
//
//  Created by Bhargav Maniar on 17/05/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var selectedImagePosition: Int? // Probably not needed
    var totalNumberOfImages: Int? // Probably not needed
    var name : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        if let imageName = selectedImage {
            name = imageName
        }
        
        name.removeLast(7)
        if(name.count > 2) {
            name = name.capitalisingFirstLetter()
        } else {
            name = name.uppercased()
        }
        title = name
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        imageView.layer.backgroundColor = UIColor.lightGray.cgColor
        
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
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, name], applicationActivities:[])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}
