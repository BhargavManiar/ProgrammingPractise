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

