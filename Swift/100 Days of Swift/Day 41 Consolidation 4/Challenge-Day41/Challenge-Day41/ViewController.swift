//
//  ViewController.swift
//  Challenge-Day41
//
//  Created by Bhargav Maniar on 25/05/2021.
//

import UIKit

class ViewController: UIViewController {
    var usedLetters = [String]()
    var allWords = [String]()
    var userInput: String = ""
    var hiddenWord: String = ""
    var currentWord: String = ""
    var wrongAnswer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Obtain the words from file manager
        if let wordsURL = Bundle.main.url(forResource: "words", withExtension: "txt") {
            if let words = try? String(contentsOf: wordsURL) {
                allWords = words.components(separatedBy: "\n")
            }
        }
        
        // Error handling if there are no items found
        if allWords.isEmpty {
            allWords = ["honey"]
        }
        
        // Add + button on the nav bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForInput))
        
        // Put a ??? title word on the nav bar
    }


}

