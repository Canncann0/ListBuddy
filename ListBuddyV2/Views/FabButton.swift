//
//  FabButton.swift
//  ListBuddyV2
//
//  Created by Doğancan Turgut on 4.12.2023.
//

import SwiftUI

struct FabButton: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(red: 0.2823529411764706, green: 0.19215686274509805, blue: 0.8313725490196079))
            
            Text(Image(systemName: "plus"))
                .font(.system(size: 24))
                .foregroundColor(.white)

        }
             .frame(height: 48 )
        
    }
}

#Preview {
    FabButton()
}
