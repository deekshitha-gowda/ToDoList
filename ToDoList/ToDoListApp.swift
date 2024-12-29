//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by ATEU on 22/12/24.
//
/*
 MVVM
 model - Data Point
 View - UI
 ViewModel - manages the model for view
 */
import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
           
        }
    }
}
