//
//  TopBar.swift
//  ListBuddyV2
//
//  Created by Doğancan Turgut on 4.12.2023.
//

import SwiftUI

struct TopBar: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            Text("Alışveriş Listem2")
                .font(.system(size: 24))
                .frame(maxWidth: .infinity, maxHeight: 44, alignment: .leading )
                .padding(.leading,16)

                .fontWeight(.semibold)
                .foregroundColor(Color(red: 0.2823529411764706, green: 0.19215686274509805, blue: 0.8313725490196079))
            
            
        }
        .padding(.top, 16)
        
    }
}

#Preview {
    TopBar()
}
