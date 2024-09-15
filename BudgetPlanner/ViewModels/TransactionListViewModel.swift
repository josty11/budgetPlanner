//
//  TransactionListViewModel.swift
//  BudgetPlanner
//
//  Created by Татьяна on 15.09.2024.
//

import SwiftUI

class TransactionListViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    
    func fetchTransactions() {
    }
    
    func deleteTransaction(id: UUID) {
    }
}
