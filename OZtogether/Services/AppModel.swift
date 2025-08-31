import Foundation
import SwiftUI

struct Event: Identifiable {
    let id = UUID()
    var title: String
    var date: Date
    var location: String
    var points: Int
    var description: String
}

struct Reward: Identifiable {
    let id = UUID()
    var title: String
    var pointsRequired: Int
    var stock: Int
}

struct UserProfile {
    var name: String
    var monthlyPoints: Int = 0
    var lifetimePoints: Int = 0
}

@MainActor
class AppModel: ObservableObject {
    @Published var user: UserProfile? = nil
    @Published var events: [Event] = [
        Event(title: "Register to vote (AEC enrolment)",
              date: Date().addingTimeInterval(86400*2),
              location: "All across Australia.",
              points: 50,
              description: "Enrol for the first time or confirm your voting details are correct."),
        Event(title: "Update official records",
              date: Date().addingTimeInterval(86400*2),
              location: "All across Australia.",
              points: 30,
              description: "Notify key agencies (Medicare, ATO, Centrelink, MyGov, driver’s license, banks) of your updated details."),
        Event(title: "Diwali Community Night",
              date: Date().addingTimeInterval(86400*2),
              location: "Melbourne CBD",
              points: 30,
              description: "Celebrate with food and music."),
        Event(title: "NAIDOC Week Welcome",
              date: Date().addingTimeInterval(86400*5),
              location: "Brunswick",
              points: 40,
              description: "Welcome to Country and shared history talk."),
        Event(title: "Harmony Day Picnic",
              date: Date().addingTimeInterval(86400*9),
              location: "Carlton Gardens",
              points: 25,
              description: "Bring a dish and meet new neighbours.")
    ]
    @Published var rewards: [Reward] = [
        Reward(title: "Museum Pass", pointsRequired: 300, stock: 20),
        Reward(title: "Myki $10 Top-Up", pointsRequired: 800, stock: 20),
        Reward(title: "Myki $50 Top-Up", pointsRequired: 3000, stock: 20),
        Reward(title: "Cultural Cooking Class", pointsRequired: 2000, stock: 20),
        Reward(title: "Learnig Foreign Language", pointsRequired: 2000, stock: 20),
        Reward(title: "Double pass to local festival", pointsRequired: 400, stock: 20),
        Reward(title: "Micro-mentoring hour with a librarian", pointsRequired: 300, stock: 20),


    ]
    @Published var attended: Set<UUID> = []

    func signIn(name: String) {
        let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard trimmed.isEmpty == false else { return }
        user = UserProfile(name: trimmed)
    }

    func signOut() { user = nil }

    func checkIn(event: Event) {
        guard let u = user, attended.contains(event.id) == false else { return }
        attended.insert(event.id)
        user = UserProfile(name: u.name,
                           monthlyPoints: u.monthlyPoints + event.points,
                           lifetimePoints: u.lifetimePoints + event.points)
    }

    func redeem(_ reward: Reward) {
        guard var u = user,
              u.monthlyPoints >= reward.pointsRequired else { return }
        if let idx = rewards.firstIndex(where: { $0.id == reward.id }), rewards[idx].stock > 0 {
            rewards[idx].stock -= 1
            u.monthlyPoints -= reward.pointsRequired
            user = u
        }
    }
}
