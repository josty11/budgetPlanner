//
//  Category.swift
//  BudgetPlanner
//
//  Created by Татьяна on 17.09.2024.
//

import SwiftUI
import RealmSwift

class Category: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String = ""
    @Persisted var iconName: String = ""
    @Persisted var tagColor: String = "#000000"
}
