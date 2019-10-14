//
//  FadeDownAnimator.swift
//  NotesCloud
//
//  Created by dongshangtong on 2019/10/14.
//  Copyright © 2019 icebartech. All rights reserved.
//

import UIKit

class MNFadeDownAnimator: NSObject, UIViewControllerAnimatedTransitioning {
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return AlertAnimationConstants.fadeDownDuration
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    
     
    
    let containerView = transitionContext.containerView
    let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
    let animationDuration = self.transitionDuration(using: transitionContext)
    
    let dimmingView: UIView? = containerView.subviews.filter { (view: UIView) -> Bool in
      return view.restorationIdentifier == AlertAnimationConstants.dimmingViewRestorationId
    }.first
    
    let animator = UIViewPropertyAnimator(duration: animationDuration, curve: .linear) {
      dimmingView?.alpha = 0.0
      fromViewController?.view.transform = CGAffineTransform(scaleX: AlertAnimationConstants.scale, y: AlertAnimationConstants.scale)
    }
    animator.addCompletion { position in
      if case .end = position {
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
      }
    }
    animator.startAnimation()
  }
}

