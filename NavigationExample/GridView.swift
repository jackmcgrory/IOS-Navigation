//
//  GridView.swift
//  NavigationExample
//
//  Created by user on 27/11/2024.
//
import Foundation
import SwiftUI

struct GridViewPage: View {
    @AppStorage(Settings.gridItemsKey) private var gridItems: Int = 20
    
    let gridLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout, spacing: 20) {
                ForEach(0..<gridItems, id: \.self) { item in
                    VStack {
                        Text("Item \(item + 1)")
                            .font(.headline)
                            .padding()
                        Color.blue
                            .frame(height: 100)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Grid View")
    }
}
