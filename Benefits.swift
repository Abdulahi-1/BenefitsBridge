//
//  Benefits.swift
//  benefitsBrdige
//
//  Created by Abdulahi Abdi on 8/4/25.
//

struct Benefit: Codable {
    let name: String
    let description: String
    let applyURL: String
    
    let minIncome: Int?
    let requiresKids: Bool?
    let requiresEmployment: Bool?
}

