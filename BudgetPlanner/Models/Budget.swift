//
//  Budget.swift
//  BudgetPlanner
//
//  Created by Татьяна on 15.09.2024.
//

import SwiftUI

struct Budget: Identifiable {
    let id: UUID
    let category: String
    var limit: Double
    var spent: Double
}
