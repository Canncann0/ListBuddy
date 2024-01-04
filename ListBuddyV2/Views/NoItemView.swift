//
//  NoItemView.swift
//  ListBuddyV2
//
//  Created by Doğancan Turgut on 4.01.2024.
//

import SwiftUI

struct NoItemView: View {
    var body: some View {
        ZStack {
            Text("Alınacaklar Listeniz Boş.")
                .font(.system(size: 12))
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    NoItemView()
}
