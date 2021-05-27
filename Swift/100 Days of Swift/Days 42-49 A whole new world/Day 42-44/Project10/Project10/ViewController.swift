//
//  ViewController.swift
//  Project10
//
//  Created by Bhargav Maniar on 26/05/2021.
//

import UIKit

class ViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPerson))
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as? PersonCell else {
            fatalError("Unable to dequeue a PersonCell") // If this point is reached a crash will occur
        }
        
        let person = people[indexPath.item]
        
        cell.name.text = person.name
        
        let path = getDocumentsDirectory().appendingPathComponent(person.image)
        cell.imageView.image = UIImage(contentsOfFile: path.path)
        
        cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        cell.imageView.layer.borderWidth = 2
        cell.imageView.layer.cornerRadius = 3
        cell.layer.cornerRadius = 7
        
        return cell
    }
    
    @objc func addNewPerson() {
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
        
        let person = Person(name: "Unknown", image: imageName)
        people.append(person)
        collectionView.reloadData()
        
        dismiss(animated: true)
    }
    
    func getDocumentsDirectory() -> URL  {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask) // Get the apps document directory
        
        return paths[0]
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let person = people[indexPath.item]
        
        let actionSheetController = UIAlertController(title: "Action", message: nil, preferredStyle: .actionSheet)

        let editAction = UIAlertAction(title: "Rename", style: .default) { [weak self] (action) in
            let alertController = UIAlertController(title: "Rename person", message: nil, preferredStyle: .alert)

            alertController.addTextField()
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            alertController.addAction(UIAlertAction(title: "OK", style: .default) { [weak self, weak alertController] _ in
                guard let newName = alertController?.textFields?[0].text else { return }
                person.name = newName
                self?.collectionView.reloadData()
            })
            self?.present(alertController, animated: true)
        }

        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { [weak self] (action) in
            let deleteAlertController = UIAlertController(title: "Delete Item", message: nil, preferredStyle: .alert)

            deleteAlertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            deleteAlertController.addAction(UIAlertAction(title: "Delete", style: .destructive){ [weak self] _ in
                self?.people.remove(at: indexPath.item)
                self?.collectionView.reloadData()
                //self?.collectionView.deleteItems(at: [indexPath])
            })
            self?.present(deleteAlertController, animated: true)
        }

        actionSheetController.addAction(editAction)
        actionSheetController.addAction(deleteAction)
        actionSheetController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(actionSheetController, animated: true)
    }
}

