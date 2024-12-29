//
//  ListView.swift
//  ToDoList
//
//  Created by ATEU on 22/12/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel : ListViewModel
      
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoItemView()
            } else {
                List {
                    ForEach(listViewModel.items){ item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item1: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo list 📝")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: {
            AddView()
        }))
    }
}
#Preview {
    NavigationView {
        ListView()
    }.environmentObject(ListViewModel())
    
}


