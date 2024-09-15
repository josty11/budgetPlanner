//
//  SplashView.swift
//  BudgetPlanner
//
//  Created by Татьяна on 15.09.2024.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        VStack {
            Text("Expense Tracker")
                .font(.largeTitle)
            ProgressView("Loading...")
        }
        .onAppear {
            
        }
    }
}
