//
//  SlideDownAnimator.swift
//  NotesCloud
//
//  Created by dongshangtong on 2019/10/14.
//  Copyright © 2019 icebartech. All rights reserved.
//

import UIKit

class MNSlideDownAnimator: NSObject, UIViewControllerAnimatedTransitioning {
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return AlertAnimationConstants.slideDownDuration
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
      fromViewController?.view.transform = CGAffineTransform(translationX: 0, y: AlertAnimationConstants.translate)
        //.scaledBy(x: 0.5, y: 0.5) // you can combine multiple animations
        //.concatenating(CGAffineTransform(rotationAngle: 2)) // you can concat multiple animations to obtain a cutsom animation
    }
    animator.addCompletion { position in
      if case .end = position {
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
      }
    }
    animator.startAnimation()
  }
}

