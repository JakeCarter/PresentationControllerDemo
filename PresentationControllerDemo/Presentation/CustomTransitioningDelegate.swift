//
//  CustomTransitioningDelegate.swift
//  PresentationControllerDemo
//
//  Created by Jake Carter on 8/4/18.
//  Copyright © 2018 Jake Carter. All rights reserved.
//

import UIKit

class CustomTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
