//
//  Transaction.swift
//  BudgetPlanner
//
//  Created by Татьяна on 15.09.2024.
//

import SwiftUI
import RealmSwift

class Transaction: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String = ""
    @Persisted var amount: Double = 0.0
    @Persisted var currency: String = "USD"
    @Persisted var date: Date = Date()
    @Persisted var category: Category?
}
