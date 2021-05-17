//
//  ViewController.swift
//  Challenge-Day23
//
//  Created by Bhargav Maniar on 17/05/2021.
//

import UIKit


extension String {
    func capitalisingFirstLetter() -> String{
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitaliseFirstLetter() {
        self = self.capitalisingFirstLetter()
    }

}

class ViewController: UITableViewController {
    
    var pictures = [String]()
    let countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Flags of Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("@3x.png") {
                pictures.append(item)
            }
        }
        
        pictures.sort()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for:  indexPath)
        var name = pictures[indexPath.row]
        
        name.removeLast(7)
        if(name.count > 2) {
            name = name.capitalisingFirstLetter()
        } else {
            name = name.uppercased()
        }
        
        cell.textLabel?.text = name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.selectedImagePosition = indexPath.row + 1
            vc.totalNumberOfImages = pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

