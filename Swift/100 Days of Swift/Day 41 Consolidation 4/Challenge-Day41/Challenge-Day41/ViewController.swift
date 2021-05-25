//
//  ViewController.swift
//  Challenge-Day41
//
//  Created by Bhargav Maniar on 25/05/2021.
//

import UIKit

class ViewController: UIViewController {
    var usedLetters = [String]()
    var allWord = [String]()
    var userInput: String = ""
    var hiddenWord: String = ""
    var currentWord: String = ""
    var wrongAnswer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Obtain the words from file manager
        if let wordsURL = Bundle.main.url(forResource: "words", withExtension: "txt") {
            if let words = try? String(contentsOf: wordsURL) {
                allWord = words.components(separatedBy: "\n")
            }
        }
        
        // Error handling if there are no items found
        if allWord.isEmpty {
            allWord = ["honey"]
        }
        
        // Put a ??? title word on the nav bar
        // Add + button on the nav bar
    }


}

