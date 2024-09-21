//
//  TransactionsListView.swift
//  BudgetPlanner
//
//  Created by Татьяна on 15.09.2024.
//

import SwiftUI
import RealmSwift
struct TransactionsListView: View {
    @ObservedObject var viewModel = TransactionListViewModel()
    @ObservedResults(Transaction.self) var transactions
    
    var body: some View {
        NavigationView {
            if transactions.isEmpty {
                VStack {
                    Image(systemName: "tray")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                    Text("No transactions yet")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                }
                .padding()
                .navigationTitle("Transactions")
            } else {
                List {
                    ForEach(transactions) { transaction in
                        VStack(alignment: .leading) {
                            Text(transaction.title)
                                .font(.headline)
                            HStack {
                                Text("\(transaction.amount, specifier: "%.2f") \(transaction.currency)")
                                Spacer()
                                Text(transaction.category?.name ?? "")
                            }
                            .font(.subheadline)
                            
                            Text(transaction.date, style: .date)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 5)
                    }//Foreach
                    .onDelete(perform: deleteTransaction)
                } //List
                .navigationTitle("Transactions")
            }//if else
        }
    }
    
    func deleteTransaction(at offsets: IndexSet) {
        guard let index = offsets.first else { return }
        let transactionToDelete = transactions[index]
        let realm = try! Realm()
        do {
            try realm.write {
                if let transaction = realm.object(ofType: Transaction.self, forPrimaryKey: transactionToDelete.id) {
                    realm.delete(transaction)
                }
            }
        } catch {
            print("Failed to delete transaction: \(error.localizedDescription)")
        }
    }
}
