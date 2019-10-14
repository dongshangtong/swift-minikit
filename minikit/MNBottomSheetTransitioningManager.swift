//
//  MNBottomSheetTransitioningManager.swift
//  NotesCloud
//
//  Created by dongshangtong on 2019/10/14.
//  Copyright © 2019 icebartech. All rights reserved.
//

import UIKit

enum BottomSheetTransitioningStyle {
  case slideUp
}

enum BottomSheetAnimationConstants {
  static let bottomViewHeight: CGFloat = 50
  static let scale: CGFloat = 0.1
  static let translate: CGFloat = UIScreen.main.bounds.height
  static let dimmingViewRestorationId: String = "dimmingView"
  static let bottomViewRestorationId: String = "bottomView"
  static let cornerRadius: CGFloat = 10.0
  static let slideUpDuration: TimeInterval = 0.4
  static let slideDownDuration: TimeInterval = 0.3
}

class MNBottomSheetTransitioningManager: NSObject, UIViewControllerTransitioningDelegate {
  
  var type: BottomSheetTransitioningStyle = .slideUp
  
  func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
    let presentationController = MNBottomSheetPresentationController(presentedViewController: presented, presenting: source)
    return presentationController
  }
  
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    switch self.type {
      case .slideUp: return MNBottomSheetSlideUpAnimator()
    }
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    switch self.type {
      case .slideUp: return MNBottomSheetSlideDownAnimator()
    }
  }
}

