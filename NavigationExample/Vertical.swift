//
//  VericalList.swift
//  NavigationExample
//
//  Created by user on 27/11/2024.
//
import SwiftUI


struct VerticalListPage: View {
    @AppStorage(Settings.verticalItemsKey) private var verticalItems: Int = 20
    var body: some View {
        List(0..<verticalItems, id: \.self) { item in
            VStack {
                Text("Item \(item + 1)")
                    .font(.headline)
                    .padding()
                Color.red
                    .frame(height: 100)
                    .cornerRadius(10)
            }
            .padding(.vertical)
        }
        .navigationTitle("Vertical List")
    }
}
