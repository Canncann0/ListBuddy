//
//  ListRowItem.swift
//  ListBuddyV2
//
//  Created by Doğancan Turgut on 4.12.2023.
//

import SwiftUI

struct ListRowItem: View {
    
    let item: ItemModel
    
    
    var body: some View {
        VStack {
            
            HStack{
                Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                    .foregroundColor(item.isCompleted ? .green : .red)
                Text(item.title)
                    .strikethrough(item.isCompleted ? true : false)
                    .font(.system(size: 16))
                Spacer()
            }
            .padding(.vertical,12)
            .padding(.horizontal,24)
            .background(Color(.white))
        .cornerRadius(12)
        }
        .padding(16)
    
    }
}

struct ListRowItem_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "domates", isCompleted: false)
    static var item2 = ItemModel(title: "salatalık", isCompleted: true)

    static var previews: some View {
        
        Group {
            ListRowItem(item: item1)
            ListRowItem(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
    
    
}
