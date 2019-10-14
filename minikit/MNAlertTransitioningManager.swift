//
//  AlertTransitioningManager.swift
//  NotesCloud
//
//  Created by dongshangtong on 2019/10/14.
//  Copyright © 2019 icebartech. All rights reserved.
//

import UIKit

enum AlertTransitioningStyle {
  case fade
  case slideUp
}

enum AlertAnimationConstants {
  static let scale: CGFloat = 0.1
  static let translate: CGFloat = UIScreen.main.bounds.height
  static let dimmingViewRestorationId: String = "dimmingView"
  static let cornerRadius: CGFloat = 10.0
  static let fadeUpDuration: TimeInterval = 0.5
  static let fadeDownDuration: TimeInterval = 0.1
  static let slideUpDuration: TimeInterval = 0.5
  static let slideDownDuration: TimeInterval = 0.3
}

class MNAlertTransitioningManager: NSObject, UIViewControllerTransitioningDelegate {
  
  var type: AlertTransitioningStyle = .fade
  
  func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
    let presentationController = MNAlertPresentationController(presentedViewController: presented, presenting: source)
    return presentationController
  }
  
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    switch self.type {
      case .fade: return MNFadeUpAnimator()
      case .slideUp: return MNSlideUpAnimator()
    }
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    switch self.type {
      case .fade: return MNFadeDownAnimator()
      case .slideUp: return MNSlideDownAnimator()
    }
    
  }
}

