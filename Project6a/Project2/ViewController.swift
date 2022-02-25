//
//  ViewController.swift
//  Project2
//
//  Created by Doğukan Inci on 17.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        self.view.layoutIfNeeded()
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
        
        title = countries[correctAnswer].uppercased()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score: " + String(score), style: .plain, target: self, action: nil)
        navigationController?.navigationBar.isUserInteractionEnabled = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: String(questionsAsked + 1) + " : " + String(10), style: .plain, target: self, action: nil)
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
        }
        else {
                title = "Wrong"
            score -= 1
        }
        questionsAsked += 1
        if title == "Wrong" {
            title = "Wrong! That’s the flag of \(countries[sender.tag].uppercased())"
        }
        if questionsAsked == 10 {
            let finalAc = UIAlertController(title: title, message: "Your final score is: \(score)", preferredStyle: .alert)
            finalAc.addAction(UIAlertAction(title: "Restart", style: .default, handler: askQuestion))
            present(finalAc,animated: true)
            questionsAsked = 0
            score = 0
        } else {
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
            
        }
        
        
    }
    
}

