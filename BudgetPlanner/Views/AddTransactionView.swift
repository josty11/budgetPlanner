//
//  AddTransactionView.swift
//  BudgetPlanner
//
//  Created by Татьяна on 15.09.2024.
//

import SwiftUI
import RealmSwift

struct AddTransactionView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var title: String = ""
    @State private var amount: String = ""
    @State private var selectedCurrency: String = "USD"
    @State private var date: Date = Date()
    @State private var selectedCategory: String?
    let currencies = ["USD", "EUR", "GBP", "JPY", "AUD"]
    let categories = [
        ("Groceries", "cart.fill"),
        ("Transport", "car.fill"),
        ("Bills", "bolt.fill"),
        ("Shopping", "bag.fill"),
        ("Entertainment", "gamecontroller.fill"),
        ("Health", "heart.fill"),
        ("Travel", "airplane"),
        ("Food", "fork.knife"),
        ("Savings", "dollarsign.circle.fill"),
        ("Other", "questionmark.circle.fill")
    ]
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Transaction Details")) {
                    TextField("Title", text: $title)
                    
                    HStack {
                        TextField("Amount", text: $amount)
                            .keyboardType(.decimalPad)
                        
                        Menu {
                            ForEach(currencies, id: \.self) { currency in
                                Button(currency) {
                                    selectedCurrency = currency
                                }
                            }
                        } label: {
                            Label(selectedCurrency, systemImage: "chevron.down.circle")
                        }
                    }
                    
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                }
                
                Section(header: Text("Choose Category")) {
                    CategoryGridView(categories: categories, selectedCategory: $selectedCategory)
                }
            }
            .navigationBarTitle("Add Transaction", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                saveTransaction()
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    func saveTransaction() {
        guard let amount = Double(amount), let selectedCategory = selectedCategory else { return }
        
        let transaction = Transaction()
        transaction.title = title
        transaction.amount = amount
        transaction.currency = selectedCurrency
        transaction.date = date
        transaction.category = selectedCategory
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(transaction)
        }
    }
}
