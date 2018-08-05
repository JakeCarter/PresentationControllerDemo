//
//  CustomPresentationController.swift
//  PresentationControllerDemo
//
//  Created by Jake Carter on 8/4/18.
//  Copyright © 2018 Jake Carter. All rights reserved.
//

import UIKit

class CustomPresentationController: UIPresentationController {
    private enum DisplayStyle {
        case halfHeight
        case fullHeight
    }
    
    var toggleHeightButtonItem: UIBarButtonItem {
        let result = UIBarButtonItem(title: "Toggle Height", style: .plain, target: self, action: #selector(toggleHeightButtonTapped(_:)))
        return result
    }
    
    private var displayStyle: DisplayStyle = .halfHeight {
        didSet {
            assert(Thread.isMainThread)
            
            UIView.animate(withDuration: 0.25) {
                self.presentedView?.frame = self.frameOfPresentedViewInContainerView
                
                self.presentedView?.setNeedsLayout()
                self.presentedView?.layoutIfNeeded()
            }
            
        }
    }
    @objc func toggleHeightButtonTapped(_ sender: UIBarButtonItem) {
        displayStyle = (displayStyle == .halfHeight) ? .fullHeight : .halfHeight
    }
    
    override var shouldPresentInFullscreen: Bool {
        return false
    }
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }
        
        var result: CGRect
        switch displayStyle {
        case .fullHeight:
            result = containerView.frame
        case .halfHeight:
            result = CGRect(x: containerView.frame.origin.x, y: containerView.frame.origin.y + containerView.frame.size.height / 2, width: containerView.frame.size.width, height: containerView.frame.size.height / 2)
            result = result.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
        }
        
        return result
    }
}

extension UIViewController {
    /// Returns the `presentationController` as a CustomPresentationController if `self` is currently being presented AND the type matches.
    var customPresentationController: CustomPresentationController? {
        // We don't want to ask for the `presentationController` until we know we are in a presentation. Otherwize UIViewController will cache its answer and use the cached `presentationController` for its next presentation. Instead, we can check if we have a `presentingViewController` to determin if we are currently presented and if we have one we can then access our `presentationController` property.
        guard let _ = presentingViewController else { return nil }
        return presentationController as? CustomPresentationController
    }
}
