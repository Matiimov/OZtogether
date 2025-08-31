import SwiftUI

struct RewardsView: View {
    @EnvironmentObject var model: AppModel
    @State private var alertItem: AlertItem?

    var body: some View {
        NavigationStack {
            ZStack {
                Color.ozBackground.ignoresSafeArea()

                List {
                    ForEach(model.rewards) { reward in
                        RewardCard(
                            title: reward.title,
                            points: reward.pointsRequired,
                            stock: reward.stock,
                            canRedeem: (model.user?.monthlyPoints ?? 0) >= reward.pointsRequired && reward.stock > 0,
                            onRedeem: {
                                if let u = model.user, u.monthlyPoints >= reward.pointsRequired, reward.stock > 0 {
                                    model.redeem(reward)
                                    alertItem = AlertItem(title: "Redeemed!", message: "Enjoy your \(reward.title).")
                                } else {
                                    alertItem = AlertItem(title: "Not enough points", message: "Attend more events to earn points.")
                                }
                            }
                        )
                        .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .safeAreaPadding(.bottom, 8)
                .navigationTitle("Rewards")
                .toolbarBackground(Color.ozBackground, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .alert(item: $alertItem) { item in
                    Alert(title: Text(item.title), message: Text(item.message), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
}

private struct RewardCard: View {
    let title: String
    let points: Int
    let stock: Int
    let canRedeem: Bool
    let onRedeem: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .firstTextBaseline) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer(minLength: 8)
                Text("\(points.formatted()) pts")
                    .font(.subheadline.weight(.semibold))
                    .foregroundColor(.ozSun)
            }

            Text("Stock: \(stock)")
                .font(.caption)
                .foregroundColor(.secondary)

            Button(action: onRedeem) {
                Text("Redeem")
                    .font(.subheadline.weight(.semibold))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
            }
            .background(RoundedRectangle(cornerRadius: 14, style: .continuous).fill(Color.ozTeal))
            .foregroundColor(.white)
            .opacity(canRedeem ? 1 : 0.45)
            .disabled(!canRedeem)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color(.systemBackground))
        )
        .shadow(color: .black.opacity(0.06), radius: 10, x: 0, y: 4)
    }
}

private struct AlertItem: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let message: String
}
