//
//  Transaction.swift
//  BudgetPlanner
//
//  Created by Татьяна on 15.09.2024.
//

import SwiftUI

struct Transaction: Identifiable {
    let id: UUID
    let title: String
    let amount: Double
    let date: Date
    let category: String
    let isExpense: Bool
}
