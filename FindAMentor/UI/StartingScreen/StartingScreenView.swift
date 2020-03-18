//
//  StartingScreenView.swift
//  FindAMentor
//
//  Created by Riccardo Cipolleschi on 18/03/2020.
//

import Foundation
import Tempura

/// The view model of the current view.
/// Here we create all the properties that are required by the view to layout itself
/// The init can access to the state to retrieve the information it needs
struct StartingScreenVM: ViewModelWithState {

  init(state: AppState) {

  }
}

class StartingScreenView: UIView, ViewControllerModellableView {
  typealias VM = StartingScreenVM

  let message = UILabel()

  func setup() {
    self.addSubview(self.message)
  }

  func style() {
    self.backgroundColor = .white
    self.message.attributedText = NSAttributedString(
      string: "Hello World!!!",
      attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
    self.message.textAlignment = .center
  }

  func update(oldModel: VM?) {
    guard let model = self.model else {
      return
    }
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    self.message.frame = .zero
    self.message.sizeToFit()
    let size = self.message.intrinsicContentSize
    self.message.frame = CGRect(x: 0, y: (self.bounds.height - size.height) / 2.0,
                                width: self.bounds.width, height: size.height)
  }
}

