import SwiftUI

struct LoginView: View {
    @EnvironmentObject var model: AppModel

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Image("OZtogether")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)

            Text("Connect with your community, attend events, and feel at home in Australia.")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)

            Spacer()

            VStack(spacing: 12) {
                Button {
                    model.signIn(name: "Charlie")
                } label: {
                    HStack(spacing: 8) {
                        Image(systemName: "person.crop.circle.fill")
                        Text("Login with myGov").fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity, minHeight: 52)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.ozTeal))
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.08), radius: 6, x: 0, y: 3)
                }

                Button {
                    model.signIn(name: "Charlie")
                } label: {
                    HStack(spacing: 8) {
                        Image(systemName: "phone.fill")
                        Text("Login with phone number").fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity, minHeight: 52)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.ozTeal.opacity(0.25), lineWidth: 1))
                    .foregroundColor(Color.ozTeal)
                    .shadow(color: Color.black.opacity(0.04), radius: 4, x: 0, y: 2)
                }
            }
            .padding(.horizontal)

            Spacer()

            Text("An Australian Government initiative")
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.ozBackground)
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(AppModel())
    }
}
