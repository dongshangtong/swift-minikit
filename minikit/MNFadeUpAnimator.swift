//
//  FadeUpAnimator.swift
//  NotesCloud
//
//  Created by dongshangtong on 2019/10/14.
//  Copyright © 2019 icebartech. All rights reserved.
//

import UIKit

class MNFadeUpAnimator: NSObject, UIViewControllerAnimatedTransitioning {
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return AlertAnimationConstants.fadeUpDuration
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
    let containerView = transitionContext.containerView
    
    let animationDuration = self.transitionDuration(using: transitionContext)
    
    toViewController?.view.transform = CGAffineTransform(scaleX: AlertAnimationConstants.scale, y: AlertAnimationConstants.scale)
    toViewController?.view.layer.cornerRadius = AlertAnimationConstants.cornerRadius
    toViewController?.view.clipsToBounds = true
    
//    let dimmingView = UIView(frame: toViewController?.view.bounds ?? CGRect(x: 0, y: 0, width: 0, height: 0))
//    dimmingView.restorationIdentifier = AlertAnimationConstants.dimmingViewRestorationId
//
    if let toView = toViewController?.view {
//      containerView.addSubview(dimmingView)
      containerView.addSubview(toView)
    }
    
//    dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
//    dimmingView.alpha = 0.0
//    
    let animator = UIViewPropertyAnimator(duration: animationDuration, dampingRatio: 0.6) {
//      dimmingView.alpha = 1.0
      toViewController?.view.transform = .identity
    }
    animator.addCompletion { position in
      transitionContext.completeTransition(position == .end)
    }
    animator.startAnimation()
  }
}
