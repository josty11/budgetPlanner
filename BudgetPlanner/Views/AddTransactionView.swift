//
//  AddTransactionView.swift
//  BudgetPlanner
//
//  Created by Татьяна on 15.09.2024.
//

import SwiftUI
struct AddTransactionView: View {
    @State private var title: String = ""
    @State private var amount: String = ""
    @State private var category: String = ""
    @State private var isExpense: Bool = true
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Amount", text: $amount)
                .keyboardType(.decimalPad)
            Picker("Category", selection: $category) {
                Text("Food").tag("Food")
                Text("Rent").tag("Rent")
                Text("Entertainment").tag("Entertainment")
            }
            Toggle("Is Expense", isOn: $isExpense)
            
            Button("Save Transaction") {

            }
        }
        .navigationTitle("Add Transaction")
    }
}
