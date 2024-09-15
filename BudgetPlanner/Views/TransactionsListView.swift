//
//  TransactionsListView.swift
//  BudgetPlanner
//
//  Created by Татьяна on 15.09.2024.
//

import SwiftUI

struct TransactionsListView: View {
    @ObservedObject var viewModel = TransactionListViewModel()
    
    var body: some View {
        List(viewModel.transactions) { transaction in
            HStack {
                VStack(alignment: .leading) {
                    Text(transaction.title)
                        .font(.headline)
                    Text(transaction.category)
                        .font(.subheadline)
                }
                Spacer()
                Text("$\(transaction.amount, specifier: "%.2f")")
                    .foregroundColor(transaction.isExpense ? .red : .green)
            }
        }
        .navigationTitle("Transactions")
        .onAppear {
            viewModel.fetchTransactions()
        }
    }
}
