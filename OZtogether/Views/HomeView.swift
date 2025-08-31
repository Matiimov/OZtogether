import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: AppModel

    var body: some View {
        ZStack {
            Color.ozBackground.ignoresSafeArea()

            if let u = model.user {
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 16) {

                        VStack(spacing: 12) {
                            HStack {
                                Image("OZtogether")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 58, height: 58)

                                Spacer()

                                Text("Gday, \(u.name)!")
                                    .font(.title2).bold()
                                    .foregroundColor(.primary)

                                Spacer()

                                Image("UserIcon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 58, height: 58)
                                    .clipShape(Circle())
                            }

                            HStack(spacing: 16) {
                                StatCard(title: "Monthly Points", value: "\(u.monthlyPoints)", color: .ozGold)
                                StatCard(title: "Lifetime Points", value: "\(u.lifetimePoints)", color: .ozTeal)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding(.top, 12)

                        HStack(spacing: 8) {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(.secondary)
                            Text("Attend community events to earn points and redeem monthly rewards.")
                                .foregroundColor(.secondary)
                                .font(.subheadline)
                        }
                        .padding(.vertical, 8)

                        ExploreAustraliaCard()
                        CulturalTipsCard()
                        CommunitySpotlightCard()

                        Button(role: .destructive) {
                            model.signOut()
                        } label: {
                            Text("Sign out")
                                .frame(maxWidth: .infinity, minHeight: 44)
                                .background(RoundedRectangle(cornerRadius: 12).stroke(Color.red.opacity(0.3)))
                        }
                        .padding(.top, 8)
                    }
                    .padding(20)
                }
            }
        }
        .navigationTitle("OZtogether")
    }
}

private struct StatCard: View {
    let title: String
    let value: String
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.caption).foregroundColor(.secondary)
            Text(value)
                .font(.title2.bold())
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(RoundedRectangle(cornerRadius: 16).fill(color.opacity(0.15)))
    }
}

private struct CulturalTipsCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {

            // Header
            HStack(spacing: 10) {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.primary.opacity(0.06))
                    Image(systemName: "sparkles")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.primary)
                }
                .frame(width: 32, height: 32)

                Text("Cultural tips of the week")
                    .font(.headline)

                Spacer(minLength: 0)
            }
            .padding(.bottom, 2)

            // Row 1
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .fill(Color.ozIndigo.opacity(0.12))
                    .frame(width: 28, height: 28)
                    .overlay(
                        Image(systemName: "book.fill")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.ozIndigo)
                    )
                    .accessibilityHidden(true)

                VStack(alignment: .leading, spacing: 3) {
                    Text("NAIDOC Week")
                        .font(.subheadline.weight(.semibold))
                    Text("A national celebration of the history, culture and achievements of Aboriginal and Torres Strait Islander peoples.")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }

                Spacer(minLength: 0)
            }

            // Soft divider aligned to text column (not the icon)
            Divider()
                .padding(.leading, 44)
                .opacity(0.4)

            // Row 2
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .fill(Color.ozTeal.opacity(0.12))
                    .frame(width: 28, height: 28)
                    .overlay(
                        Image(systemName: "quote.bubble.fill")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.ozTeal)
                    )
                    .accessibilityHidden(true)

                VStack(alignment: .leading, spacing: 3) {
                    Text("Slang: “Arvo”")
                        .font(.subheadline.weight(.semibold))
                    Text("Means ‘afternoon’. e.g., “See you this arvo!”")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }

                Spacer(minLength: 0)
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.white)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(Color.black.opacity(0.06), lineWidth: 1) // crisp edge
        )
        .shadow(color: Color.black.opacity(0.04), radius: 8, x: 0, y: 2)
    }
}

private struct CommunitySpotlightCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {

            // Header
            HStack(spacing: 10) {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.primary.opacity(0.06))
                    Image(systemName: "person.2.fill")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.primary)
                }
                .frame(width: 32, height: 32)

                Text("Community spotlight")
                    .font(.headline)

                Spacer(minLength: 0)
            }
            .padding(.bottom, 2)

            // Highlighted story
            Text("“Anh joined three local events last month and redeemed a Museum Pass. ‘I met neighbours from five countries in one day!’”")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)

            Divider()
                .padding(.leading, 44)
                .opacity(0.4)

            // Call to action
            HStack(alignment: .center, spacing: 8) {
                Circle()
                    .fill(Color.ozIndigo.opacity(0.12))
                    .frame(width: 22, height: 22)
                    .overlay(
                        Image(systemName: "hand.raised.fill")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.ozIndigo)
                    )

                Text("Feeling inspired? Check what’s on this week.")
                    .font(.footnote)
                    .foregroundColor(.secondary)

                Spacer(minLength: 0)
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.white)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(Color.black.opacity(0.06), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.04), radius: 8, x: 0, y: 2)
    }
}

private struct ExploreAustraliaCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("Explore Australia", systemImage: "map.fill")
                .font(.headline)

            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.black.opacity(0.05))
                    .frame(maxWidth: .infinity)
                    .frame(height: 140)
                VStack(spacing: 6) {
                    Image("BudjBim")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            }

            Text("Budj Bim Cultural Landscape (VIC)")
                .font(.subheadline.bold())
            Text("UNESCO World Heritage site where the Gunditjmara people built one of the world’s oldest aquaculture systems over 6,600 years ago, using stone channels to trap and farm eels.")
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 16).fill(Color.white))
        .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 2)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let m = AppModel()
        m.user = UserProfile(name: "Preview User", monthlyPoints: 12, lifetimePoints: 120)
        return NavigationStack { HomeView() }
            .environmentObject(m)
    }
}
