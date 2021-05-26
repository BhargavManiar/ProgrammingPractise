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
    @IBOutlet var lettersUsed: UITextView!
    @IBOutlet var usedLettersTitle: UILabel!
    @IBOutlet var hangmanImageView: UIImageView!
    
    var allWords = [String]()
    var usedLetters = [String]() // resetable
    var hiddenWord: String?
    var currentWord: String?
    var wrongAnswerScore: Int = 0
    
    var loggerEnable: Bool = true // for logging on std output
    
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
        
        // Setup other UI elements
        livesRemaining.text = "Remaining Lives: 7"
        lettersUsed.isEditable = false
        lettersUsed.text = " "
        usedLettersTitle.text = "Used Letters"
        usedLettersTitle.isHidden = true
//        asciiArt.text = " "
//        asciiArt.isEditable = false
        //drawAsciiImage(live: wrongAnswerScore) // update the ascii image initially
        
        // Start the game and add a ??? title word on the nav bar
        startGame()
    }
    
    // Game Functions
    
    @objc func startGame(action: UIAlertAction) {
        let funcName = "startGame"
        logger(functionName: funcName, message: "Play Again")
        resetGameVariables() // rest variables
        
        if let obtainedWord = allWords.randomElement() {
            hiddenWord = obtainedWord
        }
        logger(functionName: funcName, variableName: "hiddenWord", variableOutput: "\(String(describing: hiddenWord))")
        
        for character in hiddenWord! {
            logger(functionName: funcName, variableName: "character", variableOutput: "\(character)")
            if currentWord != nil {
                currentWord! += "?"
            } else {
                currentWord = "?"
            }
        }
        
        logger(functionName: funcName, variableName: "currentWord", variableOutput: "\(String(describing: currentWord))")
        title = currentWord
        usedLetters.removeAll(keepingCapacity: true) // Remove previous gueses
    }
    
    @objc func startGame() {
        let funcName = "startGame"
        logger(functionName: funcName, message: "Initial Game Start")
        
        if let obtainedWord = allWords.randomElement() {
            hiddenWord = obtainedWord
        }
        logger(functionName: funcName, variableName: "hiddenWord", variableOutput: "\(String(describing: hiddenWord))")
        
        for character in hiddenWord! {
            logger(functionName: funcName, variableName: "character", variableOutput: "\(character)")
            if currentWord != nil {
                currentWord! += "?"
            } else {
                currentWord = "?"
            }
        }
        
        logger(functionName: funcName, variableName: "currentWord", variableOutput: "\(String(describing: currentWord))")
        title = currentWord
        usedLetters.removeAll(keepingCapacity: true) // Remove previous gueses
    }
    
    @IBAction func guessLetter(_ sender: Any) {
        let funcName = "guessLetter"
        logger(functionName: funcName, message: "Input button pressed")
        
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
        let funcName = "checkInput"
        if input.count == 1 {
            if (!usedLetters.contains(input)) {
                usedLetters.append(input) // Remember letter used
                usedLettersTitle.isHidden = false
                lettersUsed.text += "\(input), " // Show used letter
                logger(functionName: funcName, variableName: "usedLetters", variableOutput: "\(usedLetters)")
                if (hiddenWord!.contains(input)) {
                    logger(functionName: funcName, message: "Hidden letter found")
                    updateTitle(input)
                } else {
                    logger(functionName: funcName, message: "Hidden letter not found")
                    wrongAnswer()
                }
            } else {
                logger(functionName: funcName, message: "Letter reuse detected")
                showErrorMessage(title: "Letter used already!", message: "Enter a differnet letter")
            }
        } else {
            logger(functionName: funcName, message: "Input greater than 1")
            showErrorMessage(title: "Invalid input", message: "You need to enter one character")
        }
    }
    
    func updateTitle(_ input: String) {
        let funcName = "updateTitle"
        var indexPosition = 0
        logger(functionName: funcName, variableName: "input", variableOutput: "\(input)")
        for i in hiddenWord! {
            if String(i) == input {
                // Update the currentWord, show where the letter is on the hideen work
                currentWord = currentWord?.replace(input, at: indexPosition)
            }
            
            if (currentWord?.contains("?") == false) {
                endGame(win: true)
            }
            
            indexPosition += 1
            logger(functionName: funcName, variableName: "indexPosition", variableOutput: "\(indexPosition)")
        }
        title = currentWord // Update the title
    }
    
    func wrongAnswer() {
        let funcName = "wrongAnswer"
        wrongAnswerScore += 1 // Increment wrong answer score
        livesRemaining.text = "Remaining Lives: \(7-wrongAnswerScore)"
        //drawAsciiImage(live: wrongAnswerScore) // update the ascii image
        logger(functionName: funcName, variableName: "wrongAnswerScore", variableOutput: "\(wrongAnswerScore)")
        if(wrongAnswerScore == 7) {
            endGame(win: false)
        } else {
            showErrorMessage(title: "Incorrect", message: "Try another letter")
        }
    }
    
    func endGame(win: Bool) {
        let funcName = "endGame"
        var message: String
        
        if win == true {
            message = "You Won!"
            logger(functionName: funcName, message: "Player won")
        } else {
            message = "You Lost. The word was " + hiddenWord!
            title = hiddenWord
            logger(functionName: funcName, message: "Player lost")
        }
        
        let alertController = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Play Again", style: .default, handler: startGame))
        present(alertController, animated: true)
    }
    
    func resetGameVariables() {
        let funcName = "resetGameVariables"
        
        logger(functionName: funcName, message: "Resetting Variables")
        
        usedLetters.removeAll()
        hiddenWord = ""
        currentWord = ""
        wrongAnswerScore = 0
        
        logger(functionName: funcName, variableName: "usedLetters", variableOutput: "\(usedLetters)")
        logger(functionName: funcName, variableName: "hiddenWord", variableOutput: "\(String(describing: hiddenWord))")
        logger(functionName: funcName, variableName: "currentWord", variableOutput: "\(String(describing: currentWord))")
        logger(functionName: funcName, variableName: "wrongAnswerScore", variableOutput: "\(wrongAnswerScore)")
        
        // Reset UI Elements
        livesRemaining.text = "Remaining Lives: 7"
        lettersUsed.text = " "
        //asciiArt.text = ""
        
        logger(functionName: funcName, variableName: "livesRemaining", variableOutput: "\(String(describing: livesRemaining.text))")
        logger(functionName: funcName, variableName: "lettersUsed", variableOutput: "\(String(describing: lettersUsed.text))")
        //logger(functionName: funcName, variableName: "asciiArt", variableOutput: "\(String(describing: asciiArt.text))")
    }
    
    func showErrorMessage(title: String, message: String) {
        let funcName = "showErrorMessage"
        logger(functionName: funcName, variableName: "message", variableOutput: "\(message)")
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
    

//    func drawAsciiImage(live: Int) {
//
//        switch live {
//        default:
//
//        }
//
//
//    }
    
    // Logger Functions
    
    // Messages from a function
    func logger(functionName: String, message: String) {
        if loggerEnable {
            print("\(functionName): \(message)")
        }
    }
    
    // Variable output from a function
    func logger(functionName: String, variableName: String, variableOutput: String) {
        if loggerEnable{
            print("\(functionName) -> \(variableName): \(variableOutput)")
        }
        
    }
}
