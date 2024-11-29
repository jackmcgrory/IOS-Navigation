import SwiftUI

struct BindingExample: View {
    @State private var count: Int = 0
    
    var body: some View {
        VStack {
            Text("Parent View - Count: \(count)")
                .font(.title)
            
            // Pass state down to the child view using @Binding
            ChildView(count: $count)
        }
        .border(Color.green, width:2)
        .padding(5)
        .navigationTitle("Binding Example")
    }
}

struct ChildView: View {
    // Using @Binding to bind to the parent view's state
    @Binding var count: Int

    var body: some View {
        VStack {
            Text("Child View - Count: \(count)")
                .font(.title2)
            
            Button("Increment in Child") {
                count += 1  // Changes the parent's state
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
        }.border(Color.red, width: 2).padding(5)
    }
}

struct BindingExample_Previews: PreviewProvider {
    static var previews: some View {
        BindingExample()
    }
}
