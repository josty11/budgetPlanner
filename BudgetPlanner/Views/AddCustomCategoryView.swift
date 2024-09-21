//
//  AddCustomCategoryView.swift
//  BudgetPlanner
//
//  Created by Татьяна on 17.09.2024.
//

import SwiftUI
import RealmSwift

struct AddCustomCategoryView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var selectedIconName: String = "star"
    @State private var tagColor: Color = .blue
    
    let icons = ["star", "heart", "cart", "house", "bell"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Category Name")) {
                    TextField("Enter category name", text: $name)
                }
                
                Section(header: Text("Choose Icon")) {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(icons, id: \.self) { icon in
                                Button(action: {
                                    selectedIconName = icon
                                }) {
                                    Image(systemName: icon)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .padding()
                                        .background(selectedIconName == icon ? Color.blue.opacity(0.3) : Color.clear)
                                        .cornerRadius(10)
                                }
                            }
                        }
                    }
                }
                
                Section(header: Text("Choose Tag Color")) {
                    ColorPicker("Pick a tag color", selection: $tagColor)
                }
                
                Button(action: saveCategory) {
                    HStack {
                        Spacer()
                        Text("Save Category")
                        Spacer()
                    }
                }
            }
            .navigationTitle("Add Custom Category")
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    func saveCategory() {
        let realm = try! Realm()
        
        let newCategory = Category()
        newCategory.name = name
        newCategory.iconName = selectedIconName
        newCategory.tagColor = tagColor.toHex()
        
        do {
            try realm.write {
                realm.add(newCategory)
            }
        } catch {
            print("Failed to save category: \(error.localizedDescription)")
        }
        
        presentationMode.wrappedValue.dismiss()
    }
}

extension Color {
    func toHex() -> String {
        let components = self.cgColor?.components ?? [0, 0, 0, 1]
        let r = components[0]
        let g = components[1]
        let b = components[2]
        return String(format: "#%02lX%02lX%02lX", lround(Double(r * 255)), lround(Double(g * 255)), lround(Double(b * 255)))
    }
}
