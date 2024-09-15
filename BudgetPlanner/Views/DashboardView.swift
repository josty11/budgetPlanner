//
//  DashboardView.swift
//  BudgetPlanner
//
//  Created by Татьяна on 15.09.2024.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var viewModel = DashboardViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Spacer()
                    HStack {
                        Text("Total Balance")
                        Text("$\(viewModel.totalBalance, specifier: "%.2f")")
                            .font(.title)
                    }
                    HStack {
                        Text("Income")
                        Text("$\(viewModel.totalIncome, specifier: "%.2f")")
                    }
                    HStack {
                        Text("Expenses")
                        Text("$\(viewModel.totalExpenses, specifier: "%.2f")")
                    }
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Dashboard")
            .onAppear {
                viewModel.fetchDashboardData()
            }
        }
    }
}
