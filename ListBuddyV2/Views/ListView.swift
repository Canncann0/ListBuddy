//
//  ListView.swift
//  ListBuddyV2
//
//  Created by Doğancan Turgut on 4.12.2023.
//

import SwiftUI

struct ListView: View {
   
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var showAddNewItem = false

    
    var body: some View {
        ZStack (alignment:.bottom) {
            
            VStack {
                
                TopBar()
                
               Spacer()
               
                ZStack {
                    if listViewModel.items.isEmpty {
                        NoItemView()
                    }else {
                        List {
                            ForEach(listViewModel.items) { item in
                               ListRowItem(item: item)
                                
                                    .onTapGesture {
                                        withAnimation(.linear) {
                                            listViewModel.uptadeItem(item: item)
                                        }
                                    }
                                
                            }
                            .onDelete(perform: listViewModel.deleteItem)
                            .listRowInsets(.init(top: -16, leading: -16, bottom: -16, trailing: -16))
                            
                        }
                        .background(Color(red: 0.9490196078431372, green: 0.9450980392156862, blue: 0.9647058823529412))
                    .scrollContentBackground(.hidden)
                    }
                }
               
               Spacer()
                
            }
            .listStyle(.insetGrouped)
            .listRowSpacing(12)
            
            Spacer()
            
            
            FabButton()
                .onTapGesture {
                    showAddNewItem.toggle()
                }
                .sheet(isPresented: $showAddNewItem, content: {
                    AddNewItem()
                        .presentationCornerRadius(24)
                })
            
            
        }
        .background(Color(red: 0.9490196078431372, green: 0.9450980392156862, blue: 0.9647058823529412))
    }
    
    
}

#Preview {
    ListView()
        .environmentObject(ListViewModel())
}
