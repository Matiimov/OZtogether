import SwiftUI

struct RootView: View {
    @EnvironmentObject var model: AppModel

    var body: some View {
        Group {
            if model.user == nil {
                LoginView()
            } else {
                MainTabsView()
            }
        }
        .tint(Color.ozTeal)
    }
}
