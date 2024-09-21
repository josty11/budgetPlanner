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
    @State private var selectedCategory: Category?
    let currencies = ["USD", "EUR", "GBP", "JPY", "AUD"]
    
    @ObservedResults(Category.self) var categories
    
    @State private var isShowingAddCategory = false
    
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
                    // Predefined categories and custom categories from Realm
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(categories) { category in
                                Button(action: {
                                    selectedCategory = category
                                }) {
                                    VStack {
                                        Image(systemName: category.iconName)
                                        Text(category.name)
                                    }
                                    .padding()
                                    .background(category.id == selectedCategory?.id ? Color.blue.opacity(0.3) : Color.clear)
                                    .cornerRadius(10)
                                }
                            }
                        }
                    }
                    
                    // Button to add a new custom category
                    Button(action: {
                        isShowingAddCategory.toggle()
                    }) {
                        HStack {
                            Image(systemName: "plus")
                            Text("Add Custom Category")
                        }
                    }
                }
            }
            .navigationBarTitle("Add Transaction", displayMode: .inline)
            .sheet(isPresented: $isShowingAddCategory) {
                AddCustomCategoryView()
            }
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
        
        let realm = try! Realm()
        if let managedCategory = realm.object(ofType: Category.self, forPrimaryKey: selectedCategory.id) {
            transaction.category = managedCategory
        }

        do {
            try realm.write {
                realm.add(transaction)
            }
        } catch {
            print("Error saving transaction: \(error.localizedDescription)")
        }
    }
}
