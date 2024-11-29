import SwiftUI

struct EnvironmentExample: View {
    // Using @Environment to access system-wide color scheme
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            Text("Current Color Scheme: \(colorScheme == .dark ? "Dark" : "Light")")
                .font(.title)
                .padding()
            
            Text("This is an environment example!")
                .padding()
        }
        .padding()
        .navigationTitle("Environment Example")
    }
}

struct EnvironmentExample_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentExample()
            .preferredColorScheme(.dark) // You can change this to `.light` to see the difference
    }
}
