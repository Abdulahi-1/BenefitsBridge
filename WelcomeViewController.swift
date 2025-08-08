//
//  WelcomeViewController.swift
//  benefitsBrdige
//
//  Created by Abdulahi Abdi on 8/4/25.
//

import UIKit

class WelcomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startQuizTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toQuiz", sender: self)
    }
}

