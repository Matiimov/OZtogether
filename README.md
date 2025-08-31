# OZtogether

OZtogether is a SwiftUI iOS app created for **GovHack 2025** to help new arrivals connect with Australian communities. Users can sign in, discover local events, earn points and redeem rewards while learning more about Australian culture.

## Screenshots

<table>
  <tr>
    <td align="center"><img src="OZtogether/Screenshots/LoginView.png" alt="Login Screen" width="250"/><br><b>Login Screen</b></td>
    <td align="center"><img src="OZtogether/Screenshots/HomeView.png" alt="Home Screen" width="250"/><br><b>Home Screen</b></td>
  </tr>
  <tr>
    <td align="center"><img src="OZtogether/Screenshots/EventsView.png" alt="Events Screen" width="250"/><br><b>Events Screen</b></td>
    <td align="center"><img src="OZtogether/Screenshots/RewardsView.png" alt="Rewards Screen" width="250"/><br><b>Rewards Screen</b></td>
  </tr>
</table>

## Features

- **Easy sign‑in options**: log in with myGov or a phone number to start earning points right away.
- **Personal dashboard**: track monthly and lifetime points on the home screen alongside cultural tips and community spotlights.
- **Event check‑ins**: browse upcoming events, attend, and check in to collect points.
- **Redeemable rewards**: exchange points for transit top‑ups, museum passes, and other perks.
- **Shared data model**: a single `AppModel` manages user profile, events, rewards and point calculations across the app.

## Project Structure

- `App/` – application entry point and root view coordination.
- `Services/` – `AppModel` containing all business logic and sample data.
- `Views/` – SwiftUI screens for login, home, events, rewards and tabs.
- `Theme/` – reusable colors and date formatting.
- `Assets.xcassets/` – image and icon resources.
- `docs/images/` – placeholder folder for future screenshots.

## Getting Started

1. Open `OZtogether.xcodeproj` in Xcode 15 or later.
2. Select an iOS simulator or device and run the app.
3. Sign in to explore events, collect points and redeem rewards.

## License

MIT License

Copyright (c) 2025 [Mateusz Wichtowski / OZtogether]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Acknowledgements

Built for **GovHack 2025**.

