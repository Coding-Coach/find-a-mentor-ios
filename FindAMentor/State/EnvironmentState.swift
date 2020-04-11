//
//  EnvironmentState.swift
//  FindAMentor
//
//  Created by Riccardo Cipolleschi on 11/04/2020.
//

import Foundation
import Katana
import UserNotifications

extension AppState {
  /// This structure contains the environment information
  /// for the current session of the user.
  struct EnvironmentState: State {
    var keyboardState: KeyboardState = KeyboardState()
    var pushNotificationState: PushNotificationState = PushNotificationState()
  }

  // MARK: - Keyboard State
  
  /// This struct contains the current state of the keyboard.
  /// The keyboard can be hidden or visible.
  /// When visible, it is presented with some animation options
  /// that need to imitated by the rest of the UI for a smooth animation
  struct KeyboardState: State, Equatable {
      static let defaultAnimationDuration: Double = 0.3
      static let defaultAnimationCurve: UIView.AnimationCurve = .easeInOut

      enum Visibility: Equatable {
        case hidden
        case visible(frame: CGRect)
      }

      var visibility: Visibility = .hidden
      var animationDuration = defaultAnimationDuration
      var animationCurve = defaultAnimationCurve

      /// The current height of the keyboard. 0 if the keyboard is hidden
      var height: CGFloat {
        switch self.visibility {
        case .hidden:
          return 0
        case .visible(let frame):
          return frame.height
        }
      }
  }

  // MARK: - Push Notification State

  /// This structure contains the current state of the Push Notification
  /// It also define an enumeration with all the supported notification types
  struct PushNotificationState: State, Equatable {

    var pushNotificationStatuses: [PushNotificationType: UNAuthorizationStatus] = [:]

    /// Enumeration with all the supported type. This is required because the
    /// UNAuthorizationOptions does not conform to Hashable, therefore it
    /// has to be converted from an Obj-C type to a Swift type.
    enum PushNotificationType: Int {
      case alert
      case badge
      case carPlay
      case criticalAlert
      case provisional
      case sound

      init(from option: UNAuthorizationOptions) {
        switch option {
        case .alert:
          self = .alert
        case .badge:
          self = .badge
        case .carPlay:
          self = .carPlay
        case .criticalAlert:
          self = .criticalAlert
        case .provisional:
          self = .provisional
        case .sound:
          self = .sound
        default:
          fatalError("Cannot create a PushNotificationType")
        }
      }
    }
  }
}
