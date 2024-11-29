//
//  observableTest.swift
//  NavigationExample
//
//  Created by user on 27/11/2024.
//
import SwiftUI


class NameModel: ObservableObject {
    @Published var listOfNames: [String] = []
    
    
    func addName(name: String) {
        listOfNames.append(name)
    }
    
    func removeName(name: String) {
        listOfNames.removeAll(where: { $0 == name })
    }
    
}


struct ObservedObjectTest: View {
    @ObservedObject var viewmodel = NameModel()

    @State var name: String = ""
    
    var body: some View {
        VStack {
            Text("Count: \(viewmodel.listOfNames.count)")
                .font(.largeTitle)
            TextField("Enter Name", text: $name)
                .padding()
            HStack{
                Button("Add Name") {
                    viewmodel.addName(name: name)
                    name = ""
                }
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(8)
                Button("Remove Name") {
                    viewmodel.removeName(name: name)
                    name = ""
                }
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            
          ForEach(viewmodel.listOfNames, id: \.self) { name in
              Text(name).font(.headline)
            }
           
        }
        .padding()
        .navigationTitle("ObservedObject Example")
    }
}

struct ObservedObjectTest_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectTest()
    }
}
