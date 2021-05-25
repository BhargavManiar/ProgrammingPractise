//
//  ViewController.swift
//  Challenge-Day41
//
//  Created by Bhargav Maniar on 25/05/2021.
//

import UIKit

extension String {
    func replace(_ with: String, at index: Int) -> String {
        var modifiedString = String()
        for (i, char) in self.enumerated() {
            modifiedString += String((i == index) ? with : String(char))
        }
        return modifiedString
    }
}

class ViewController: UIViewController {
    var allWords = [String]()
    var usedLetters = [String]() // resetable
    var hiddenWord: String?
    var currentWord: String?
    var wrongAnswerScore: Int = 0
    
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
        
        // Start the game and add a ??? title word on the nav bar
        startGame()
    }
    
    // Game Functions
    @objc func startGame(action: UIAlertAction) {
        print("Start Game: Play Again")
        if let obtainedWord = allWords.randomElement() {
            hiddenWord = obtainedWord
        }
        
        print("Start Game -> Hidden Word: \(String(describing: hiddenWord))")
        
        for character in hiddenWord! {
            print("Start Game -> Character: \(String(describing: character))")
            if currentWord != nil {
                currentWord! += "?"
            } else {
                currentWord = "?"
            }
        }
        
        print("Start Game -> Current Word: \(String(describing: currentWord))")
        title = currentWord
        usedLetters.removeAll(keepingCapacity: true) // Remove previous gueses
    }
    
    @objc func startGame() {
        print("Start Game: Initial Game Start")
        
        if let obtainedWord = allWords.randomElement() {
            hiddenWord = obtainedWord
        }
        print("Start Game -> Hidden Word: \(String(describing: hiddenWord))")
        
        for character in hiddenWord! {
            print("Start Game -> Character: \(String(describing: character))")
            if currentWord != nil {
                currentWord! += "?"
            } else {
                currentWord = "?"
            }
        }
        
        print("Start Game -> Current Word: \(String(describing: currentWord))")
        title = currentWord
        usedLetters.removeAll(keepingCapacity: true) // Remove previous gueses
    }
    
    @objc func promptForInput() {
        let alertController = UIAlertController(title: "Enter character", message: nil, preferredStyle: .alert)
        alertController.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) {
            [weak self, weak alertController] _ in
            guard let answer = alertController?.textFields?[0].text else { return }
            self?.checkInput(answer.lowercased())
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(submitAction)
        present(alertController, animated: true)
    }
    
    func checkInput(_ input: String) {
        if input.count == 1 {
            if (!usedLetters.contains(input)) {
                usedLetters.append(input) // Remember letter used
                if (hiddenWord!.contains(input)) {
                    updateTitle(input)
                } else {
                    wrongAnswer()
                }
            } else {
                showErrorMessage(title: "Letter used already!", message: "Enter a differnet letter")
            }
        } else {
            showErrorMessage(title: "Invalid input", message: "You need to enter one character")
        }
    }
    
    func updateTitle(_ input: String) {
        var indexPosition = 0
        print("Character '\(String(describing: input))' found")
        for i in hiddenWord! {
            if String(i) == input {
                // Update the currentWord, show where the letter is on the hideen work
                currentWord = currentWord?.replace(input, at: indexPosition)
            }
            
            if (currentWord?.contains("?") == false) {
                endGame(win: true)
            }
            
            indexPosition += 1
            print("Update Title -> Index Position: \(indexPosition)")
        }
        title = currentWord // Update the title
    }
    
    func wrongAnswer() {
        wrongAnswerScore += 1 // Increment wrong answer score
        print("Wrong Answer -> Wrong Answer: \(wrongAnswerScore)")
        if(wrongAnswerScore == 7) {
            endGame(win: false)
        } else {
            showErrorMessage(title: "Incorrect", message: "Try another letter")
        }
    }
    
    func endGame(win: Bool) {
        var message: String
        if win == true {
            message = "You Won!"
            print("Player won")
        } else {
            message = "You Lost. The word was " + hiddenWord!
            title = hiddenWord
            print("Player lost")
        }
        
        resetGameVariables() // rest variables
        
        let alertController = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Play Again", style: .default, handler: startGame))
        present(alertController, animated: true)
    }
    
    func resetGameVariables() {
        print("Reset Game Variables: Resetting Variables")
        usedLetters.removeAll()
        hiddenWord = ""
        currentWord = ""
        wrongAnswerScore = 0
        print("Reset Game Variables -> Used Letters \(usedLetters)")
        print("Reset Game Variables -> Hidden Words \(hiddenWord!)")
        print("Reset Game Variables -> Current Word \(currentWord!)")
        print("Reset Game Variables -> Wrong Answer Score \(wrongAnswerScore)")
    }
    
    func showErrorMessage(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }

}
