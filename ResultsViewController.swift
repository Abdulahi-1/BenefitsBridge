//  ResultsViewController.swift
//  benefitsBrdige
//
//  Created by Abdulahi Abdi on 8/4/25.
//

import UIKit

struct Program {
    let name: String
    let description: String
    let minIncome: Int?           // Optional filters
    let requiresKids: Bool?
    let requiresEmployment: Bool?
    let url: URL?
}

class ResultsViewController: UITableViewController {
    
    var userAnswers: (minIncome: Int, requiresKids: Bool, requiresEmployment: Bool)?
    

    let allPrograms: [Program] = [
        Program(name: "SNAP",
                description: "Provides food assistance to low-income individuals.",
                minIncome: 2000,
                requiresKids: nil,
                requiresEmployment: nil,
                url: URL(string: "https://www.fns.usda.gov/snap")),

        Program(name: "Medicaid",
                description: "Health coverage for low-income families.",
                minIncome: 2500,
                requiresKids: nil,
                requiresEmployment: nil,
                url: URL(string: "https://www.medicaid.gov")),

        Program(name: "TANF",
                description: "Temporary financial help for families in need.",
                minIncome: 3000,
                requiresKids: true,
                requiresEmployment: nil,
                url: URL(string: "https://www.acf.hhs.gov/ofa/programs/tanf")),

        Program(name: "Housing Assistance",
                description: "Helps with affordable housing or rent.",
                minIncome: nil,
                requiresKids: nil,
                requiresEmployment: false,
                url: URL(string: "https://www.hud.gov/topics/rental_assistance"))
    ]

    
  
    var filteredPrograms: [Program] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let answers = userAnswers {
            filteredPrograms = allPrograms.filter { program in
                let incomeMatch = (program.minIncome == nil) || (answers.minIncome <= program.minIncome!)
                let kidsMatch = (program.requiresKids == nil) || (program.requiresKids == answers.requiresKids)
                let employmentMatch = (program.requiresEmployment == nil) || (program.requiresEmployment == answers.requiresEmployment)
                return incomeMatch && kidsMatch && employmentMatch
            }
        } else {
            filteredPrograms = allPrograms
        }
        
        tableView.reloadData()
    }
    
    // MARK: - Table View Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPrograms.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "ProgramCell", for: indexPath)
        let program = filteredPrograms[indexPath.row]
        cell.textLabel?.text = program.name
        cell.detailTextLabel?.text = program.description
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let program = filteredPrograms[indexPath.row]
        
        if let url = program.url {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            let alert = UIAlertController(title: "No Website", message: "This program does not have a website link.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }

}

