//
//  BudgetView.swift
//  BudgetPlanner
//
//  Created by Татьяна on 15.09.2024.
//

import SwiftUI
struct BudgetView: View {
    @ObservedObject var viewModel = BudgetViewModel()
    
    var body: some View {
        List(viewModel.budgetCategories) { budget in
            HStack {
                Text(budget.category)
                Spacer()
                VStack {
                    Text("Limit: \(budget.limit, specifier: "%.2f")")
                    Text("Spent: \(budget.spent, specifier: "%.2f")")
                }
            }
        }
        .navigationTitle("Manage Budgets")
        .onAppear {
            viewModel.fetchBudgets()
        }
    }
}
