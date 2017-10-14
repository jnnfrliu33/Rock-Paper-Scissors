//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Jennifer Liu on 30/09/2017.
//  Copyright © 2017 Jennifer Liu. All rights reserved.
//

import UIKit

// MARK: - Shape: String

// The enum "Shape" represents a play or move
enum Shape: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    static func randomShape() -> Shape {
        let shapes = ["Rock", "Paper", "Scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        return Shape(rawValue: shapes[randomChoice])!
    }
}
// MARK: - ResultViewController: UIViewController

class ResultViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var resultView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var rematchButton: UIButton!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayResult()
    }
    
    // MARK: Properties
    
    // When the ResultViewController is initialized a userChoice is passed in and an opponent's play is generated.
    var userChoice: Shape!
    let opponentChoice: Shape = Shape.randomShape()
    
    // MARK: UI
    
    // The displayResult method generates the image and message for the results of a match.
    
    func displayResult() {
        var imageName: String
        var text: String
        let matchup = "\(userChoice.rawValue) vs. \(opponentChoice.rawValue)"
        
        switch (userChoice!, opponentChoice) {
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            imageName = "\(userChoice.rawValue)-\(opponentChoice.rawValue)"
            text = "You win with \(matchup)!"
        case (.Scissors, .Rock), (.Rock, .Paper), (.Paper, .Scissors):
            imageName = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
            text = "You lose with \(matchup)!"
        default:
            imageName = "tie"
            text = "\(matchup): it's a tie!"
        }
        
        imageName = imageName.lowercased()
        resultView.image = UIImage(named: imageName)
        resultLabel.text = text
    }
    
    // MARK: Actions
    
    @IBAction func rematch() {
        // Dismiss this view controller
        self.dismiss(animated: true, completion: nil)
    }

}
