//
//  ViewController.swift
//  Project5
//
//  Created by Bhargav Maniar on 19/05/2021.
//

import UIKit

class ViewController: UITableViewController {
    var allWords = [String]()
    var usedWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty { // If there are no items
            allWords = ["silkworm"]
        }
        
        startGame()
        
    }
    
    func startGame() {
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true) // Remove previous guesses
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) {
            [weak self, weak ac] _ in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ answer: String) {
        let lowerAnswer = answer.lowercased()
        
        let errorTitle: String
        let errorMessage: String
        
        if isMinLength(word: lowerAnswer) {
            if isSameAsGiven(word: lowerAnswer) {
                if isPossible(word: lowerAnswer) {
                    if isOriginal(word: lowerAnswer) {
                        if isReal(word: lowerAnswer) {
                            usedWords.insert(answer, at: 0)
                            
                            let indexPath = IndexPath(row: 0, section: 0)
                            tableView.insertRows(at: [indexPath], with: .automatic)
                            
                            return
                        } else {
                            errorTitle = "Word not recognised"
                            errorMessage = "You can't just make them up, you know!"
                        }
                    } else {
                        errorTitle = "Word already used"
                        errorMessage = "Be more original!"
                    }
                } else {
                    guard let title = title else { return } // Just for educational purposed, not required
                    errorTitle = "Word not possible"
                    errorMessage = "You can't spell that word from \(title.lowercased())."
                }
            } else {
                errorTitle = "Same as given word"
                errorMessage = "Enter a differnt word"
            }
        } else {
            errorTitle = "Word length too small"
            errorMessage = "Enter a longer word"
        }
        
        let ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        
        
    }
    
    // Below are functions for validation
    
    func isPossible(word: String) -> Bool {
        guard var tempWord = title?.lowercased() else {return false}
        
        for letter in word {    // Check if letters in the word exist in the given word
            if let position = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: position)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word) // Check if the word was already given
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    
    func isMinLength(word: String) -> Bool {
        if word.count < 3 {
            return false
        }
        return true
     }
    
    func isSameAsGiven(word: String) -> Bool {
        guard let tempWord = title?.lowercased() else {return false}
        
        if word.lowercased() == tempWord {
            return false
        }
        return true
    }
    
}

