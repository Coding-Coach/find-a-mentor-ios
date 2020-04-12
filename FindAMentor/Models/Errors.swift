//
//  Errors.swift
//  FindAMentor
//
//  Created by Riccardo Cipolleschi on 12/04/2020.
//

import Foundation
extension Models {
  enum Auth0Error: Error {
    case logoutFailed
  }
}
