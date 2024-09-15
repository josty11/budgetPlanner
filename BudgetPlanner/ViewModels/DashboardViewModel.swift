//
//  DashboardViewModel.swift
//  BudgetPlanner
//
//  Created by Татьяна on 15.09.2024.
//

import SwiftUI

class DashboardViewModel: ObservableObject {
    @Published var totalBalance: Double = 0.0
    @Published var totalIncome: Double = 0.0
    @Published var totalExpenses: Double = 0.0
    @Published var budget: [Budget] = []
    @Published var transactions: [Transaction] = []
    
    func fetchDashboardData() {
    }
}
