import SwiftUI

struct MainTabsView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house.fill") }

            EventsView()
                .tabItem { Label("Events", systemImage: "calendar") }

            RewardsView()
                .tabItem { Label("Rewards", systemImage: "gift.fill") }
        }
    }
}
