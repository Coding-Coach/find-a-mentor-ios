import Foundation
import Katana

/// This is the state of the whole app.
/// This structure will contain all the informations required by the app
/// to work at runtime
struct AppState: State, Codable {

  enum CodingKeys: String, CodingKey {
    case userState
    case mentorsState
    case loginState
  }

  // MARK: - Persisted Slices
  var loginState: LoginState = LoginState()
  var userState: UserState = UserState()
  var mentorsState: MentorsState = MentorsState()

  // MARK: - Non persisted Slices
  var environmentState: EnvironmentState = EnvironmentState()

}
