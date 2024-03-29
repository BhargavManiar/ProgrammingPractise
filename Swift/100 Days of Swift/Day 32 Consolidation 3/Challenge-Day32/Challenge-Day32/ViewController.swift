//
//  ViewController.swift
//  Challenge-Day32
//
//  Created by Bhargav Maniar on 20/05/2021.
//

import UIKit

class ViewController: UITableViewController {
    var shoppingList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Title
        title = "Shopping List"
        
        // Navigation bar items
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(trashItems))
        navigationItem.leftBarButtonItem?.isEnabled = false
        
        // Bar button items
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let share = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        toolbarItems = [spacer, spacer, spacer, share]
        navigationController?.isToolbarHidden = false
        toolbarItems![3].isEnabled = false
        
        // Table view options
        tableView.allowsSelection = false
    }
    
    func disableButtons() {
        navigationItem.leftBarButtonItem?.isEnabled = false
        toolbarItems![3].isEnabled = false
        
    }

    // Table view functions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            shoppingList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            if shoppingList.count == 0 {
                disableButtons()
            }
        }
    }
    
    // Shoppinglist functions
    
    @objc func addItem() {
        let alertController = UIAlertController(title: "Enter item", message: nil, preferredStyle: .alert)
        alertController.addTextField()
        navigationItem.leftBarButtonItem?.isEnabled = true
        toolbarItems![3].isEnabled = true
        
        let submitItem = UIAlertAction(title: "Add", style: .default) {
            [weak self, weak alertController] _ in
            guard let itemAdded = alertController?.textFields?[0].text else { return }
            self?.shoppingList.insert(itemAdded, at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            self?.tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
        alertController.addAction(submitItem)
        present(alertController, animated: true)
    }
    
    @objc func trashItems() {
        shoppingList.removeAll(keepingCapacity: true)
        tableView.reloadData()
        disableButtons()
    }
    
    @objc func shareTapped() {
        let list = shoppingList.joined(separator: "\n")
        let viewController = UIActivityViewController(activityItems: [list], applicationActivities: [])
        present(viewController, animated: true)
    }

}
