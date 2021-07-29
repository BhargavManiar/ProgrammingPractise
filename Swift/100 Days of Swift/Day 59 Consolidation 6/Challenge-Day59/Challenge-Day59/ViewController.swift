//
//  ViewController.swift
//  Challenge-Day59
//
//  Created by Bhargav Maniar on 28/07/2021.
//

import UIKit

class ViewController: UITableViewController {
    var countries = [Country]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        performSelector(inBackground: #selector(loadJSON), with: nil)
    }
    
    // Error Alert
    
    @objc func showError() {
        let alertController = UIAlertController(title: "Loading Error", message: "There was a problem loading the data", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
    
    // JSON Related Functions
    
    @objc func loadJSON() {
        if let path = Bundle.main.path(forResource: "Countries", ofType: "json") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                parse(json: data)
                return
            }
        }
    }
    
    @objc func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonCountries = try? decoder.decode(Countries.self, from: json) {
            countries = jsonCountries.data
            
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        } else {
            performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
        }
    }
    
    // Table View Functions

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //    let viewController = DetailViewController()
    //    viewController.detailItem = petitions[indexPath.row]
    //    navigationController?.pushViewController(viewController, animated: true)
    }
}

