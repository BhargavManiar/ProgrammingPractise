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
    @IBOutlet var livesRemaining: UILabel!
    @IBOutlet var scoreTotal: UILabel!
    @IBOutlet var lettersUsed: UITextView!
    @IBOutlet var usedLettersTitle: UILabel!
    @IBOutlet var hangmanImageView: UIImageView!
    
    var allWords = [String]()
    var score: Int = 0
    var usedLetters = [String]()
    var hiddenWord: String?
    var currentWord: String?
    var wrongAnswerScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Obtain the words from disk
        if let wordsURL = Bundle.main.url(forResource: "words", withExtension: "txt") {
            if let words = try? String(contentsOf: wordsURL) {
                allWords = words.components(separatedBy: "\n")
            } else {
                allWords = ["honey"]
            }
        }
 
        // Setup UI elements
        resetGameVariables() // (Re)sets UI elements and game variables
        lettersUsed.isEditable = false
        usedLettersTitle.text = "Used Letters"
        
        // Start the game and add a ??? title word on the nav bar
        setInitialTitle()
    }
    
    // Game Functions
    
    @objc func startGame(action: UIAlertAction) {
        resetGameVariables() // rest variables
        setInitialTitle()
    }
    
    @IBAction func guessLetter(_ sender: Any) {
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
                usedLettersTitle.isHidden = false
                
                // Show letters used
                if lettersUsed.text.count == 1 {
                    lettersUsed.text += "\(input)" // Add letter without comma
                } else {
                    lettersUsed.text += ", \(input)" // Add letter with comma
                }
                
                if (hiddenWord!.contains(input)) {
                    updateTitle(input)
                } else {
                    wrongAnswer()
                }
            } else {
                alertControllerMessage(title: "Letter used already!", message: "Enter a differnet letter", buttonTitle: "OK", handler: nil)
            }
        } else {
            alertControllerMessage(title: "Invalid input", message: "You need to enter one character", buttonTitle: "OK", handler: nil)
        }
    }
    
    func setInitialTitle() {
        if let obtainedWord = allWords.randomElement() {
            hiddenWord = obtainedWord
        }
        
        for _ in hiddenWord! {
            if currentWord != nil {
                currentWord! += "?"
            } else {
                currentWord = "?"
            }
        }
        
        title = currentWord!
    }
    
    func updateTitle(_ input: String) {
        var indexPosition = 0
        score += 1
        for i in hiddenWord! {
            if String(i) == input {
                // Update the currentWord, show where the letter is on the hideen work
                currentWord = currentWord?.replace(input, at: indexPosition)
            }
            
            if (currentWord?.contains("?") == false) {
                endGame(win: true)
            }
            
            indexPosition += 1
        }
        title = currentWord!
        scoreTotal.text = "Score: \(score)"
    }
    
    func updateImageView() {
        hangmanImageView.image = UIImage(named: "Hang Man Drawing \(wrongAnswerScore)")
    }
    
    func wrongAnswer() {
        wrongAnswerScore += 1 // Increment wrong answer score
        livesRemaining.text = "Remaining Lives: \(7-wrongAnswerScore)"
        updateImageView()
        if(wrongAnswerScore == 7) {
            endGame(win: false)
        } else {
            alertControllerMessage(title: "Incorrect", message: "Try another letter", buttonTitle: "OK", handler: nil)
        }
    }
    
    func endGame(win: Bool) {
        var message: String
        
        if win == true {
            message = "You Won!"
        } else {
            message = "You Lost. The word was '" + hiddenWord! + "'."
            title = hiddenWord
        }
        
        alertControllerMessage(title: "Game Over", message: message, buttonTitle: "Play Again?", handler: startGame)
    }
    
    func resetGameVariables() {
        // Reset game variables
        usedLetters.removeAll()
        hiddenWord = ""
        currentWord = ""
        wrongAnswerScore = 0
        
        // Reset UI Elements
        livesRemaining.text = "Remaining Lives: 7"
        lettersUsed.text = " "
        usedLettersTitle.isHidden = true
        hangmanImageView.image = UIImage(named: "Hang Man Drawing 0")
        scoreTotal.text = "Score: \(score)"
    }
    
    func alertControllerMessage(title: String, message: String, buttonTitle: String, handler: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
        present(alertController, animated: true)
    }
    
}
