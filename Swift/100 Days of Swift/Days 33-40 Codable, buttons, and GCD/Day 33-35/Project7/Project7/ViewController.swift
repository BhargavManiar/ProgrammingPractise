//
//  ViewController.swift
//  Project7
//
//  Created by Bhargav Maniar on 20/05/2021.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()
    var originalPetitions = [Petition]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(showCredits))
        let filterButton = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3.decrease.circle"), style: .plain, target: self, action: #selector(filterButton))
        let clearFilterButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(clearFilter))
        navigationItem.leftBarButtonItems = [filterButton, clearFilterButton]
        changeButtonState(active: true)
        
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
                return
            }
        }
        
        showError() // Only runs if the above statements fail
    }
    
    // Credit button alert
    
    @objc func showCredits() {
        let alertController = UIAlertController(title: "Credits", message: "Data from: www.hackingwithswift.com", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: .default))
        present(alertController, animated: true)
    }
    
    // Error Alert
    
    func showError() {
        let alertController = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
    
    // JSON Parse
    
    func parse(json: Data) { // Data is any type of binary data
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            originalPetitions = petitions
            tableView.reloadData()
        }
    }
    
    @objc func filterButton() {
        let filterController = UIAlertController(title: "Filter", message: "Enter a search term", preferredStyle: .alert)
        filterController.addTextField()
        
        let filterTerm = UIAlertAction(title: "Submit", style: .default) {
            [weak self, weak filterController] _ in
            guard let answer = filterController?.textFields?[0].text else { return }
            self?.filter(searchTerm: answer.lowercased())
        }
        
        filterController.addAction(filterTerm)
        present(filterController, animated: true)
    }
    
    func filter(searchTerm: String) {
        var filtered = [Petition]()
        petitions = originalPetitions
        filtered = petitions.filter {$0.title.contains(searchTerm) || $0.body.contains(searchTerm)}
        petitions = filtered
        changeButtonState(active: false)
        tableView.reloadData()
    }
    
    @objc func clearFilter() {
        petitions = originalPetitions
        changeButtonState(active: true)
        tableView.reloadData()
    }
    
    func changeButtonState(active: Bool) {
        navigationItem.leftBarButtonItems?[0].isEnabled = true    // Search Filter, always remain active
        navigationItem.leftBarButtonItems?[1].isEnabled = !active   // Clear Fiter
    }
    // Table View Functions
    
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

