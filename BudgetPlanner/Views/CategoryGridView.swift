//
//  CategoryGridView.swift
//  BudgetPlanner
//
//  Created by Татьяна on 16.09.2024.
//

import SwiftUI

struct CategoryGridView: View {
    let categories: [(String, String)]
    @Binding var selectedCategory: String?
    
    private let columns = [
        GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(categories, id: \.0) { category in
                VStack {
                    Image(systemName: category.1)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .padding()
                        .background(selectedCategory == category.0 ? Color.blue.opacity(0.3) : Color.clear)
                        .cornerRadius(10)
                    
                    Text(category.0)
                        .font(.caption)
                }
                .onTapGesture {
                    selectedCategory = category.0
                }
            }
        }
        .padding(.vertical)
    }
}

