//
//  Settings.swift
//  NavigationExample
//
//  Created by user on 27/11/2024.
//

import Foundation
import SwiftUI

struct SettingsPage: View {
    @AppStorage(Settings.userNameKey) private var userName: String = ""
    @AppStorage(Settings.userAgeKey) private var userAge: String = ""
    @AppStorage(Settings.horizontalItemsKey) private var horizontalItems: Int = 20
    @AppStorage(Settings.verticalItemsKey) private var verticalItems: Int = 20
    @AppStorage(Settings.gridItemsKey) private var gridItems: Int = 20
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Settings")
                .font(.largeTitle)
            
            Text("Name: \(userName.isEmpty ? "Not set" : userName)")
            Text("Age: \(userAge.isEmpty ? "Not set" : userAge)")
            Text("Grid items : \(gridItems)")
            Text("Horizontal items : \(horizontalItems)")
            Text("Vertical items : \(verticalItems)")
            
            Spacer()
        }
        .padding()
        .navigationTitle("Settings")
    }
}
