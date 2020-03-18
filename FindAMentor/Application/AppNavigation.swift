//
//  AppNavigation.swift
//  FindAMentor
//
//  Created by Riccardo Cipolleschi on 18/03/2020.
//

import Foundation
import Tempura

enum Screen: String, CaseIterable {
  case startingScreen
}

/// Conformance for the StartingScreenVC to the Routable protocol
/// Required by Tempura to identify the VC that can be used during the navigation
extension StartingScreenVC: RoutableWithConfiguration {
  var routeIdentifier: RouteElementIdentifier {
    return Screen.startingScreen.rawValue
  }

  var navigationConfiguration: [NavigationRequest : NavigationInstruction] {
    return [:]
  }
}
