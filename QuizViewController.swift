//
//  QuizViewController.swift
//  benefitsBrdige
//
//  Created by Abdulahi Abdi on 8/4/25.
//

import UIKit

class QuizViewController: UIViewController {
    
    
    
    @IBOutlet weak var getBenefitsButton: UIButton!
    @IBOutlet weak var hasKidsSwitch: UISwitch!
    
    @IBOutlet weak var isEmployedSwitch: UISwitch!
    
    @IBOutlet weak var incomeTextField: UITextField!
    
    override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        @IBAction func checkBenefitsTapped(_ sender: UIButton) {
            let hasKids = hasKidsSwitch.isOn
            let isEmployed = isEmployedSwitch.isOn
            let income = Int(incomeTextField.text ?? "") ?? 0
            
            // Create tuple matching ResultsViewController expectations:
            let userAnswers = (minIncome: income, requiresKids: hasKids, requiresEmployment: isEmployed)
            
            performSegue(withIdentifier: "toResults", sender: userAnswers)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toResults",
               let resultsVC = segue.destination as? ResultsViewController,
               let userAnswers = sender as? (minIncome: Int, requiresKids: Bool, requiresEmployment: Bool) {
                resultsVC.userAnswers = userAnswers
            }
        }

}

