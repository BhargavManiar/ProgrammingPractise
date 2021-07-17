//
//  ViewController.swift
//  Project1
//
//  Created by Bhargav Maniar on 11/05/2021.
//

import UIKit

class ViewController: UICollectionViewController {//UITableViewController {
    var pictures = [Picture]()
    
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
        
        // performSelector(inBackground: #selector(loadImages), with: nil)
        // tableView.reloadData()
        collectionView.reloadData()
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
        cell.name?.text = transformString(str: pictures[indexPath.row].name)
        cell.layer.borderColor = UIColor.lightGray.cgColor
        
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 7
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row].image
                navigationController?.pushViewController(vc, animated: true)
        }
    }
    
//    @objc func loadImages() {
//        let fm = FileManager.default
//        let path = Bundle.main.resourcePath!
//        let items = try! fm.contentsOfDirectory(atPath: path)
//
//        for item in items {
//            if item.hasPrefix("nssl"){
//                pictures.append(item)
//            }
//        }
//        pictures.sort() // Sort pictures array
//        print(pictures)
//    }
    
    /*
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

