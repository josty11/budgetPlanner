//
//  BudgetViewModel.swift
//  BudgetPlanner
//
//  Created by Татьяна on 15.09.2024.
//

import SwiftUI

class BudgetViewModel: ObservableObject {
    @Published var budgetCategories: [Budget] = []
    
    func fetchBudgets() {
    }
    
    func updateBudget(for category: String, amount: Double) {
    }
}
