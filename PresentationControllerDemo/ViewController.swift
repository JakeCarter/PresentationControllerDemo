//
//  ViewController.swift
//  PresentationControllerDemo
//
//  Created by Jake Carter on 8/3/18.
//  Copyright © 2018 Jake Carter. All rights reserved.
//

import UIKit

class CustomPresentationController: UIPresentationController {
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
    }
}

class CustomTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presenting: presenting)
    }
}

class ViewController: UIViewController {
    var currentTransitioningDelegate: UIViewControllerTransitioningDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func presentButtonTapped(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "OtherViewController")
        let nav = UINavigationController(rootViewController: vc)
        
        nav.modalPresentationStyle = .custom
        
        currentTransitioningDelegate = CustomTransitioningDelegate()
        nav.transitioningDelegate = currentTransitioningDelegate
        
        present(nav, animated: true, completion: nil)
    }
}

