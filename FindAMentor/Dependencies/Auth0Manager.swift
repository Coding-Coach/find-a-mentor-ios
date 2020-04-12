//
//  Auth0Manager.swift
//  FindAMentor
//
//  Created by Riccardo Cipolleschi on 12/04/2020.
//

import Foundation
import Auth0
import Hydra

/// Protocol that completely defines and masks the Auth0 API.
protocol Auth0Manager {
  /// Function that begins the authentication flow
  /// - parameter scope: The scope of this specific authentication flow
  func startAuthentication(with scope: String) -> Promise<Credentials>

  /// Function tha begins the logout process for the user
  func logout() -> Promise<Void>

  /// Resumes the login process after the user logged in
  /// - parameter from: The URL that is asked to be opened
  /// - parameter options: options passed to the app
  func resumeAuthentication(from url: URL, with options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool
}

/// Implementation for the Auth0 Manager
class Auth0ManagerImpl: Auth0Manager {

  /// the backend endpoint
  var audience: String

  /// Default initializer
  init(audience: String) {
    self.audience = audience
  }

  func startAuthentication(with scope: String) -> Promise<Credentials> {
    return Promise<Credentials>(in: .background) { [unowned self] resolve, reject, _ in
      // is it safe to use unowned here because self refers to the manager and
      // the manager is kept alive by the Katana Store. No risk to access it when nil

      Auth0.webAuth().scope(scope).audience(self.audience).start { result in
        switch result {
        case .failure(let error):
          reject(error)
        case .success(let credentials):
          resolve(credentials)
        }
      }
    }
  }

  func logout() -> Promise<Void> {
    return Promise<Void>(in: .background) { resolve, reject, _ in
      Auth0.webAuth().clearSession(federated: false) { successful in
        guard successful else {
          return reject(Models.Auth0Error.logoutFailed)
        }
        resolve(())
      }
    }
  }

  func resumeAuthentication(from url: URL, with options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
    return Auth0.resumeAuth(url, options: options)
  }



}
