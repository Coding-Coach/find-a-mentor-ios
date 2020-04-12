//
//  LoginState.swift
//  FindAMentor
//
//  Created by Riccardo Cipolleschi on 11/04/2020.
//

import Foundation
import Katana

extension AppState {

  /// This structure contains all the informations related to the user's login.
  /// The backend is using Auth0 for authentication.
  struct LoginState: State, Codable {
    // TODO: Study Auth0 to understand what to put here.
    // In general we would like to keep the token and everything we need to
    // eventually refresh it

  }
}
