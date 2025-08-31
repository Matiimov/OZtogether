import SwiftUI

struct EventsView: View {
    @EnvironmentObject var model: AppModel
    @State private var alert: (title: String, message: String)?

    var body: some View {
        NavigationStack {
            List {
                ForEach(model.events) { event in
                    EventRow(
                        event: event,
                        isAttended: model.attended.contains(event.id)
                    ) {
                        // onCheckIn
                        model.checkIn(event: event)
                        alert = ("Checked in", "You earned \(event.points) points!")
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    .listRowBackground(Color.clear)
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Color.ozBackground.ignoresSafeArea())
            .navigationTitle("Upcoming Events In Your Area")
            .navigationBarTitleDisplayMode(.inline)
            .alert(item: Binding(
                get: { alert.map { AlertItem(title: $0.title, message: $0.message) } },
                set: { _ in alert = nil })
            ) { item in
                Alert(title: Text(item.title), message: Text(item.message), dismissButton: .default(Text("OK")))
            }
        }
    }
}

private struct EventRow: View {
    @EnvironmentObject var model: AppModel
    let event: Event
    let isAttended: Bool
    let onCheckIn: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Title + points
            HStack(alignment: .firstTextBaseline) {
                Text(event.title)
                    .font(.title3.weight(.semibold)) // smaller than .headline but still strong
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)

                Spacer(minLength: 12)

                HStack(spacing: 6) {
                    Image(systemName: "star.fill")
                    Text("+\(event.points)")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .padding(.vertical, 6)
                .padding(.horizontal, 10)
                .background(
                    Capsule().fill(Color.ozSun.opacity(0.12))
                )
                .foregroundColor(.ozSun)
            }

            // Meta
            Text("\(event.location) • \(DateFormatter.ozLong.string(from: event.date))")
                .font(.footnote)
                .foregroundColor(.secondary)

            // Description
            Text(event.description)
                .font(.footnote)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)

            // CTA
            Button(action: onCheckIn) {
                Text(isAttended ? "Already Checked In" : "Sign In for Event")
                    .font(.subheadline.weight(.semibold))
                    .frame(maxWidth: .infinity, minHeight: 36)
            }
            .buttonStyle(.plain) // remove heavy default style
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(isAttended ? Color.gray.opacity(0.15) : Color.ozTeal)
            )
            .foregroundColor(isAttended ? .secondary : .white)
            .disabled(isAttended)
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.white)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(Color.black.opacity(0.08), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.04), radius: 8, x: 0, y: 2)
    }
}

private struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
}
