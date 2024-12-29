//
//  ListRowView.swift
//  ToDoList
//
//  Created by ATEU on 22/12/24.
//
import SwiftUI

struct ListRowView: View {
    let item : ItemModel
    var body: some View {
        HStack{
            Image( systemName: item.isCompleted ? "checkmark.circle": "circle")
                .foregroundColor(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
            Spacer()
            
        }
    }
}
//struct ListRowView_Previews {
//    static previews { ListRowView_Previews }
//}
