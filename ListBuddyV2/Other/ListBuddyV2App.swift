//
//  ListBuddyV2App.swift
//  ListBuddyV2
//
//  Created by Doğancan Turgut on 3.12.2023.
//

import SwiftUI

@main
struct ListBuddyV2App: App {
    
   @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ListView()
        }
        .environmentObject(listViewModel)
    }
}
