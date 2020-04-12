//
//  BackendManager.swift
//  FindAMentor
//
//  Created by Riccardo Cipolleschi on 12/04/2020.
//

import Foundation
import Hydra

/// This protocol defines the public interface of the Backend Manager
/// It contains all the functions that masks the APIs call
protocol BackendManager {

  // MARK: - Mentors

  /// Retrieve the list of mentors
  func getMentors() -> Promise<[Models.User]>

  /// Send a request for mentorship from a user to another.
  /// - parameter from: the requesting user identifier
  /// - parameter to: the mentor identifier
  /// - parameter requestInfo: the set of informations that are attached to the request
  // TODO: improve the requestInfo object
  func requestMentorship(from userId: String, to mentorId: String, requestInfo: String) -> Promise<Void>

  /// Retrieve the list of mentorhips for a specific mentor
  /// - parameter mentorId: the identifier of the mentor
  func mentorships(for mentorId: String) -> Promise<Models.Mentorship>

  /// Updates a mentorship with a new set of application info
  /// - parameter applicationId: the identifier of the application
  /// - parameter applicationInfo: a the model of the application
  func updateMentorshipStatus(for applicationId: String, with applicationInfo: Models.Mentorship) -> Promise<Void>


  // MARK: - Users

  /// Retrieve the model of the user currently logged in
  func getCurrentUser() -> Promise<Models.User>

  /// Retrieve the model of the user given a specific id
  /// - parameter with: The identifier of the user
  func getUser(with id: String) -> Promise<Models.User>

  /// Updates the model of the user, given a new model.
  /// This method can be used to update the goals of the user or any profile information
  /// - parameter with: the new Model for the user
  func updateUser(with model: Models.User) -> Promise<Void>

}

class BackendManagerImpl: BackendManager {
  func getMentors() -> Promise<[Models.User]> {
    fatalError("Not implemented yet")
  }

  func requestMentorship(from userId: String, to mentorId: String, requestInfo: String) -> Promise<Void> {
    fatalError("Not implemented yet")
  }

  func mentorships(for mentorId: String) -> Promise<Models.Mentorship> {
    fatalError("Not implemented yet")
  }

  func updateMentorshipStatus(for applicationId: String, with applicationInfo: Models.Mentorship) -> Promise<Void> {
    fatalError("Not implemented yet")
  }

  func getCurrentUser() -> Promise<Models.User> {
    fatalError("Not implemented yet")
  }

  func getUser(with id: String) -> Promise<Models.User> {
    fatalError("Not implemented yet")
  }

  func updateUser(with model: Models.User) -> Promise<Void> {
    fatalError("Not implemented yet")
  }


}
