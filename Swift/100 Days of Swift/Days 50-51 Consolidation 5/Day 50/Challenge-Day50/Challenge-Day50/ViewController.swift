//
//  ViewController.swift
//  Challenge-Day50
//
//  Created by Bhargav Maniar on 05/06/2021.
//

import UIKit

class ViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var pictures = [Pictures]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPicture))
        
        let defaults = UserDefaults.standard
        
        if let savedPictures = defaults.object(forKey: "people") as? Data {
            let jsonDecoder = JSONDecoder()
            
            do {
                pictures = try jsonDecoder.decode([Pictures].self, from: savedPictures)
            } catch {
                print("Failed to load people.")
            }
        }
    }

    // Table view functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        let image = pictures[indexPath.row]
        cell.textLabel?.text = image.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            let image = pictures[indexPath.row]
            viewController.selectedImage = getDocumentsDirectory().appendingPathComponent(image.image).path
            viewController.selectedCaption = image.caption
            viewController.selectedName = image.name
            //save()
            navigationController?.pushViewController(viewController, animated: true)
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        let picture = Pictures(name: "Unknown", image: imageName, caption: "Empty Caption")
        pictures.append(picture)
        save()
        tableView.reloadData()
        
        dismiss(animated: true) // Add save after this
    }

    // Data related functions
    func save() {
        let jsonEncoder = JSONEncoder()
        
        if let savedData = try? jsonEncoder.encode(pictures) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "people")
        } else {
            print("Failed to save people.")
        }
    }
    
    func getDocumentsDirectory() -> URL  {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask) // Get the apps document directory
        
        return paths[0]
    }
}

