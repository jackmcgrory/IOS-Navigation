import SwiftUI

// Struct for storing settings
struct Settings {
    static let userNameKey = "userName"
    static let userAgeKey = "userAge"
    static let gridItemsKey = "gridItems"
    static let horizontalItemsKey = "horizontalItems"
    static let verticalItemsKey = "verticalItems"
}

struct ContentView: View {
    
    // User settings (stored in UserDefaults)
    @AppStorage(Settings.userNameKey) private var userName: String = ""
    @AppStorage(Settings.userAgeKey) private var userAge: String = ""
    @AppStorage(Settings.gridItemsKey) private var gridItems : Int = 20
    @AppStorage(Settings.horizontalItemsKey) private var horizontalItems : Int = 20
    
    // State variable to track which page is selected from the menu
    @State private var selectedPage: String? = nil

    var body: some View {
        NavigationView {
            VStack {
                Text("Main Page")
                    .font(.largeTitle)
                    .padding()
                
                NavigationLink("Go to Grid View!", destination: GridViewPage())
                    .padding()
                
                NavigationLink("Go to Horizontal List", destination: HorizontalListPage())
                    .padding()
                
                NavigationLink("Go to Vertical List", destination: VerticalListPage())
                    .padding()
                
                NavigationLink("Go to Form Page", destination: FormPage())
                    .padding()
                
                NavigationLink("Go to Settings", destination: SettingsPage())
                    .padding()
            }
            .navigationTitle("Navigation Example")
            .navigationBarItems(leading: HamburgerMenu)
            
            // Programmatic NavigationLink that is hidden but controls navigation
            .background(
                NavigationLink(
                    destination: destinationView(for: selectedPage),
                    isActive: .constant(selectedPage != nil)
                ) {
                    EmptyView()
                }
            )
        }
    }
    
    // Function to return the correct destination view based on the page
    private func destinationView(for page: String?) -> some View {
        switch page {
        case "GridViewPage":
            return AnyView(GridViewPage())
        case "HorizontalListPage":
            return AnyView(HorizontalListPage())
        case "VerticalListPage":
            return AnyView(VerticalListPage())
        case "FormPage":
            return AnyView(FormPage())
        case "SettingsPage":
            return AnyView(SettingsPage())
        default:
            return AnyView(EmptyView())
        }
    }
    
    // Hamburger menu button
    private var HamburgerMenu: some View {
        Menu {
            // Set selectedPage to the corresponding tag when a menu item is tapped
            Button("Go to Grid View") {
                selectedPage = "GridViewPage"
            }
            Button("Go to Horizontal List") {
                selectedPage = "HorizontalListPage"
            }
            Button("Go to Vertical List") {
                selectedPage = "VerticalListPage"
            }
            Button("Go to Form Page") {
                selectedPage = "FormPage"
            }
            Button("Go to Settings") {
                selectedPage = "SettingsPage"
            }
        } label: {
            Image(systemName: "line.horizontal.3")  // Hamburger icon
                .font(.title)
        }
    }
}

#Preview {
    ContentView()
}
