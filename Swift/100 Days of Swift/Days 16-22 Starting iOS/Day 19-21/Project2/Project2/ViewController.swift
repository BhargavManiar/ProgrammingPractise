//
//  ViewController.swift
//  Project2
//
//  Created by Bhargav Maniar on 14/05/2021.
//

import UIKit

extension String {
    func capitalisingFirstLetter() -> String{
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitaliseFirstLetter() {
        self = self.capitalisingFirstLetter()
    }
}

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var currentQuestion = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        if(countries[correctAnswer].count > 2) {
            title = "Q\(currentQuestion) " + countries[correctAnswer].capitalisingFirstLetter() + " - Score: \(score)"
        } else {
            title = "Q\(currentQuestion) " + countries[correctAnswer].uppercased() + " - Score: \(score)"
        }
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var correctionMessage: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            correctionMessage = ""
            score += 1
        } else {
            title = "Wrong"
            correctionMessage = "That's the flag of " + countries[sender.tag].capitalisingFirstLetter() + ".\n"
            score -= 1
        }
        
        currentQuestion += 1
        
        if currentQuestion == 11 {
            title = "End of Game"
            let finalac = UIAlertController(title: title, message: "Final Score: \(score)", preferredStyle: .alert)
            finalac.addAction(UIAlertAction(title: "Play Again", style: .default, handler: askQuestion))
            present(finalac, animated: true)
            score = 0
            correctAnswer = 0
            currentQuestion = 1
        } else {
            let ac = UIAlertController(title: title, message: correctionMessage + "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
    }
    
}

