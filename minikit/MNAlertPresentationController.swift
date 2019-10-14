//
//  AlertPresentationController.swift
//  NotesCloud
//
//  Created by dongshangtong on 2019/10/14.
//  Copyright © 2019 icebartech. All rights reserved.
//

import UIKit

class MNAlertPresentationController: UIPresentationController {
  
 
  override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
    super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
  }
  

  
  @objc func dimmingViewTapped(tapRecognizer: UITapGestureRecognizer) {
    presentingViewController.dismiss(animated: true, completion: nil)
  }
  
  override func presentationTransitionWillBegin() {
    guard let containerView = self.containerView else {
      return
    }
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(dimmingViewTapped(tapRecognizer:)))
       containerView.addGestureRecognizer(tapRecognizer)
  }
    
  override func containerViewWillLayoutSubviews() {
    presentedView?.frame = self.frameOfPresentedViewInContainerView
  }
  
  override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
    return self.presentedViewController.preferredContentSize
  }
  
  override var frameOfPresentedViewInContainerView: CGRect {
    var presentedViewFrame = CGRect.zero
    
    guard let presentedView = presentedView,
      let containerBounds = containerView?.bounds else {
        return presentedViewFrame
    }
    presentedViewFrame.size = size(forChildContentContainer: presentedViewController, withParentContainerSize: containerBounds.size)
    presentedViewFrame.origin.x = (presentedView.bounds.width - self.presentedViewController.preferredContentSize.width) / 2
    presentedViewFrame.origin.y = (presentedView.bounds.height - self.presentedViewController.preferredContentSize.height) / 2 - 30
    
    return presentedViewFrame
  }
}
