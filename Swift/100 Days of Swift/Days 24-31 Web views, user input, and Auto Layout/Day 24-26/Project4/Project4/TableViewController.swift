//
//  TableTableViewController.swift
//  Project4
//
//  Created by Bhargav Maniar on 18/05/2021.
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

class TableViewController: UITableViewController {
    let websites = ["apple.com", "hackingwithswift.com", "github.com", "youtube.com", "wikipedia.org"]
    var name : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Simple Browser"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Website", for: indexPath)
        name = websites[indexPath.row].capitalisingFirstLetter()
        name.removeLast(4)
        cell.textLabel?.text = name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Browser") as? ViewController {
            vc.selectedWebsite = websites[indexPath.row]
            vc.websites = websites
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
