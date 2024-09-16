//
//  DashboardView.swift
//  BudgetPlanner
//
//  Created by Татьяна on 15.09.2024.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var viewModel = DashboardViewModel()
    @State private var showingAddTransaction = false

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
                    Spacer()
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
            .navigationBarItems(trailing: Button(action: {
                showingAddTransaction = true
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.title)
            })
            .sheet(isPresented: $showingAddTransaction) {
                AddTransactionView()
            }
            .onAppear {
                viewModel.fetchDashboardData()
            }
        }
    }
}
