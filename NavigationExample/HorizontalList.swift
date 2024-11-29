//
//  HorizontalList.swift
//  NavigationExample
//
//  Created by user on 27/11/2024.
//

import Foundation
import SwiftUI


struct HorizontalListPage: View {
    @AppStorage(Settings.horizontalItemsKey) private var horizontalItems: Int = 20
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(0..<horizontalItems, id: \.self) { item in
                    VStack {
                        Text("Item \(item + 1)")
                            .font(.headline)
                            .padding()
                        Color.green
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Horizontal List")
    }
}
