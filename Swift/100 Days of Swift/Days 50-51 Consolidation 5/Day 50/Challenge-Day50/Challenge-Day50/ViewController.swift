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
        
        // Load data from UserDefaults
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
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteItem = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
            self.pictures.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.save()
        }
        
        let edit = UIContextualAction(style: .normal, title: "Name") { (UIContextualAction, view, boolValue) in
            let image = self.pictures[indexPath.row]
            let alertController = UIAlertController(title: "Enter name", message: nil, preferredStyle: .alert)
            alertController.addTextField()
            let submitItem = UIAlertAction(title: "Add", style: .default) {_ in
                guard let itemAdded = alertController.textFields?[0].text else { return }
                image.name = itemAdded
                self.save()
                tableView.reloadData()
            }
            alertController.addAction(submitItem)
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alertController, animated: true)
        }
        
        let caption = UIContextualAction(style: .normal, title: "Caption") { (UIContextualAction, view, boolValue) in
            let image = self.pictures[indexPath.row]
            let alertController = UIAlertController(title: "Enter caption", message: nil, preferredStyle: .alert)
            alertController.addTextField()
            let submitItem = UIAlertAction(title: "Add", style: .default) {_ in
                guard let itemAdded = alertController.textFields?[0].text else { return }
                image.caption = itemAdded
                self.save()
            }
            alertController.addAction(submitItem)
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alertController, animated: true)
        }
        
        edit.backgroundColor = UIColor.systemBlue
        caption.backgroundColor = UIColor.systemGreen
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteItem, edit, caption])
        
        return swipeActions
    }
    
    // Picker functions
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
        
        let picture = Pictures(name: "Unknown", image: imageName, caption: "")
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

