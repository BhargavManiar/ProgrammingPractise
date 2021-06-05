//
//  ViewController.swift
//  Challenge-Day50
//
//  Created by Bhargav Maniar on 05/06/2021.
//

import UIKit

class ViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPicture))
    }

    // Table view functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
//            vc.selectedImage = pictures[indexPath.row]
//            vc.selectedImagePosition = indexPath.row + 1 // Get the current position
//            vc.totalNumberOfImages = pictures.count      // Get the total number of images
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func addPicture() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let alertController = UIAlertController(title: "Source", message: nil, preferredStyle: .actionSheet) // The action sheet
            
            alertController.addAction(UIAlertAction(title: "Photos", style: .default, handler: { [weak self] _ in // Photos library option
                self?.showPickerView(showCamera: false)
            }))
            
            alertController.addAction(UIAlertAction(title: "Camera", style: .default, handler: { [weak self] _ in // Camera option
                self?.showPickerView(showCamera: true)
            }))
            
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel)) // Cancel button
            
            present(alertController, animated: true) // Show the options in the action sheet
        } else {
            showPickerView(showCamera: false) // Show the photos library when + is pressed
        }
    }
    
    func showPickerView(showCamera: Bool) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate  = self
        if showCamera {
            picker.sourceType = .camera
        }
        present(picker, animated: true)
    }

}

