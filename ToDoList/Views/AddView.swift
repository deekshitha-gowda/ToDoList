//
//  AddView.swift
//  ToDoList
//
//  Created by ATEU on 22/12/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textfieldText: String = ""
    
    @State var alertTitle: String = " "
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here", text: $textfieldText)
                    .padding(.horizontal)
                    .frame(height: 52)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }.padding(14)

        }.navigationTitle("Add an item")
            .alert(isPresented: $showAlert, content: {
                getAlert()
            })
            
    }
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textfieldText)
            presentationMode.wrappedValue.dismiss()
        }

    }
    func textIsAppropriate() -> Bool {
        
        if textfieldText.count < 3 {
            alertTitle = "Your new todo Item must be at least 3 characters long 😁"
            showAlert.toggle()
            return false
        }
        
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}
#Preview {

    AddView()
}
