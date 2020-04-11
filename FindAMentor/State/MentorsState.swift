//
//  MentorsState.swift
//  FindAMentor
//
//  Created by Riccardo Cipolleschi on 11/04/2020.
//

import Foundation
import Katana

extension AppState {

  /// This is the slice of state that populates the mentors
  /// list
  struct MentorsState: State, Codable {
    // TODO: study the mentors API to understand the models
    // If the mentors ends up being very complex, consider to split them
    // in multiple slices.
  }
}
