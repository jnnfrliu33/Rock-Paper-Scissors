//
//  PlayViewController.swift
//  Roshambo
//
//  Created by Jennifer Liu on 30/09/2017.
//  Copyright © 2017 Jennifer Liu. All rights reserved.
//

import UIKit

// MARK: - PlayViewController: UIViewController

class PlayViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    

    // MARK: Programmatic Approach
    
    @IBAction func playRock(_ sender: UIButton) {
        let controller: ResultViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        controller.userChoice = getUserShape(sender)
        present(controller, animated: true, completion: nil)
    }
    
    // MARK: Segue with Code Approach
    
    @IBAction func playPaper(_ sender: UIButton) {
        performSegue(withIdentifier: "showResult", sender: sender)
    }

    // MARK: Segue Approach
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            let controller = segue.destination as! ResultViewController
            controller.userChoice = getUserShape(sender as! UIButton)
        }
    }
    
    // MARK: Utilities
    
    // The enum "Shape" represents a play or move
    func getUserShape(_ sender: UIButton) -> Shape {
        // Titles are set to one of: Rock, Paper, or Scissors
        let shape = sender.title(for: UIControlState())!
        return Shape(rawValue: shape)!
    }
}

