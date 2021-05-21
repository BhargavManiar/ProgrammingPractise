//
//  ViewController.swift
//  Project7
//
//  Created by Bhargav Maniar on 20/05/2021.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        let urlString : String
        
        if navigationController?.tabBarItem.tag == 0 {
            // Hacking With Swift Cache
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            // White House API
            //urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
            
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
    }
    
    func parse(json: Data) { // Data is any type of binary data
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailViewController()
        viewController.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }


}

