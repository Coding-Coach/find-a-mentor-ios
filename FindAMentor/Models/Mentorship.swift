//
//  Mentorship.swift
//  FindAMentor
//
//  Created by Riccardo Cipolleschi on 12/04/2020.
//

import Foundation

extension Models {
  /// Model for the mentorhips
  struct Mentorship: Codable {
    /// Possible statuses of a request
    enum Status: String, Codable {
      case accepted
      case pending
      case rejected
    }

    /// The current status of the request
    var status: Status

    /// The description of the request
    var description: String

    /// The reason why the mentor has asked for the mentorship
    var reason: String
  }
}
