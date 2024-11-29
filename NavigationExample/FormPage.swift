//
//  FormPage.swift
//  NavigationExample
//
//  Created by user on 27/11/2024.
//
import Foundation
import SwiftUI

struct FormPage: View {
    @AppStorage(Settings.userNameKey) private var userName: String = ""
    @AppStorage(Settings.userAgeKey) private var userAge: String = ""
    @AppStorage(Settings.horizontalItemsKey) private var horizontalItems: Int = 20
    @AppStorage(Settings.verticalItemsKey) private var verticalItems: Int = 20
    @AppStorage(Settings.gridItemsKey) private var gridItems: Int = 20
    
    var body: some View {
        Form {
            Section(header: Text("User Information")) {
                TextField("Enter your name", text: $userName)
                TextField("Enter your age", text: $userAge)
                    .keyboardType(.numberPad)
                VStack {
                        Text("Grid Items: \(gridItems)") // Display the current value of gridItems
                        Slider(value: Binding(
                            get: { Double(gridItems) },  // Convert Int to Double for the slider
                            set: { gridItems = Int($0) } // Convert Double back to Int
                            ),
                            in: 1...100, step: 1)
                            .padding()
                        }
                VStack {
                        Text("Horizontal Items: \(horizontalItems)") // Display the current value of gridItems
                        Slider(value: Binding(
                            get: { Double(horizontalItems) },  // Convert Int to Double for the slider
                            set: { horizontalItems = Int($0) } // Convert Double back to Int
                            ),
                            in: 1...100, step: 1)
                            .padding()
                        }
                VStack {
                        Text("Vertical Items: \(verticalItems)") // Display the current value of gridItems
                        Slider(value: Binding(
                            get: { Double(verticalItems) },  // Convert Int to Double for the slider
                            set: { verticalItems = Int($0) } // Convert Double back to Int
                            ),
                            in: 1...100, step: 1)
                            .padding()
                        }
            }
            
            Button("Save") {
                // Settings are automatically saved to UserDefaults via @AppStorage
                print("Settings saved!")
            }
        }
        .navigationTitle("Form Page")
    }
}
