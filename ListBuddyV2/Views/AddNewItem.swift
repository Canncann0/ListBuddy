//
//  AddNewItem.swift
//  ListBuddyV2
//
//  Created by Doğancan Turgut on 5.12.2023.
//

import SwiftUI

struct AddNewItem: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @Environment (\.dismiss) var dismiss
    @State var userText : String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    
    var body: some View {
        NavigationView {
            VStack (spacing: 20) {
                
                Image(ImageResource.illustration)
                HStack (alignment: .center) {
                    TextField("Ne almak istiyorsun", text: $userText)
                        .font(.system(size: 16))
                        .italic()
                        .lineSpacing(24)
                        .padding(12.0)
                        .background(Color.white.cornerRadius(12))
                        .toolbar {
                            ToolbarItem( placement: .cancellationAction) {
                                Button(action: {
                                    dismiss()
                                }, label: {
                                    Image(systemName: "xmark")
                                        .font(.system(size: 20))
                                        .foregroundColor(.red)
                                })
                            }
                            
                            ToolbarItem( placement: .destructiveAction) {
                                Button(action: {
                                    saveButtonPressed()
                                }, label: {
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 20))
                                        .foregroundColor(Color(red: 0.2823529411764706, green: 0.19215686274509805, blue: 0.8313725490196079))
                                })
                            }
                    }
                }
                
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight:.infinity)
        .background(Color(red: 0.949, green: 0.9450980392156862, blue: 0.9647058823529412))
        }
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
    }
    
    func saveButtonPressed() {
        
        if textIsAppropriate() {
            listViewModel.addItem(title: userText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if userText.count < 3 {
            alertTitle = "3 harften fazla olmalı🤪"
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
    AddNewItem()
        .environmentObject(ListViewModel())
}
