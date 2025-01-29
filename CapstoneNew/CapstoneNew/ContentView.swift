import SwiftUI
import MapKit


// MARK: - Main App
@main
struct SocialMediaApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}

// MARK: - MainTabView
struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map.fill")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}




// MARK: - Preview Provider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainTabView()
                .previewDisplayName("Full App")
            
            HomeView()
                .previewDisplayName("Home View")
            MapView()
                .previewDisplayName("Map View")
        
            SettingsView()
                .previewDisplayName("Settings View")
            
        }
    }
}
