import SwiftUI

// ObservableObject for shared state
class CounterModel: ObservableObject {
    @Published var count: Int = 0
}

struct ObservedObjectExample: View {
    @ObservedObject var viewmodel = CounterModel()

    var body: some View {
        VStack {
            Text("Count: \(viewmodel.count)")
                .font(.largeTitle)
            
            Button("Increment") {
                viewmodel.count += 1  // Update the shared state
            }
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
        .navigationTitle("ObservedObject Example")
    }
}

struct ObservedObjectExample_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectExample()
    }
}
