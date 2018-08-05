//
//  ViewController.swift
//  PresentationControllerDemo
//

import UIKit

class ViewController: UIViewController {
    var customTransitioningDelegate = CustomTransitioningDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func presentButtonTapped(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "OtherViewController")
        let nav = UINavigationController(rootViewController: vc)
        
        nav.modalPresentationStyle = .custom
        nav.transitioningDelegate = customTransitioningDelegate
        
        present(nav, animated: true, completion: nil)
    }
}

