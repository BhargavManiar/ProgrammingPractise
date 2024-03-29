//
//  ViewController.swift
//  Project1
//
//  Created by Bhargav Maniar on 11/05/2021.
//

import UIKit

class ViewController: UICollectionViewController {//UITableViewController {
    var pictures = [Picture]()
    var counterData = [String : Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasPrefix("nssl"){
                let entry = Picture(name: item, image: item)
                pictures.append(entry)
            }
        }
        
        // Load data
        let defaults = UserDefaults.standard
        
        if let savedCounterData = defaults.object(forKey: "counterData") as? Data {
            if let decodedCounterData = try?
            NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedCounterData) as? [String : Int] {
                counterData = decodedCounterData
            }
        } else { // If there is no data, create an empty dictionary
            for item in items {
                counterData[item] = 0
            }
        }
        
        // performSelector(inBackground: #selector(loadImages), with: nil)
        // tableView.reloadData()
        collectionView.reloadData()
    }
    
    func save() { // Function to save data
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: counterData, requiringSecureCoding: false) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "counterData")
        }
    }
    
    func transformString(str: String) -> String {
        return String(String(str.dropFirst(4)).dropLast(4))
    }
    
    // Collection view functions
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Picture", for: indexPath) as! PictureCell
        
        cell.imageView.image = UIImage(named: pictures[indexPath.row].image)
        cell.name?.text = transformString(str: pictures[indexPath.row].name) + " (\(counterData[pictures[indexPath.row].image]!))"
        cell.layer.borderColor = UIColor.lightGray.cgColor
        
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 7
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            let imageName = pictures[indexPath.row].image
            counterData[imageName]? += 1 // Increment counter for the specific image
            //print("Image Name: \(imageName) Counter: \(counterData[imageName]!)") // Display data on the console
            save() //Save the counter data
            collectionView.reloadData()
            
            vc.selectedImage = pictures[indexPath.row].image
            navigationController?.pushViewController(vc, animated: true)
            vc.selectedImagePosition = indexPath.row + 1 // Get the current position
            vc.totalNumberOfImages = pictures.count      // Get the total number of images
        }
    }
    
    /*
    @objc func loadImages() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
        pictures.sort() // Sort pictures array
        print(pictures)
    }
    
    // Table view functions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.selectedImagePosition = indexPath.row + 1 // Get the current position
            vc.totalNumberOfImages = pictures.count      // Get the total number of images
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    */
}

