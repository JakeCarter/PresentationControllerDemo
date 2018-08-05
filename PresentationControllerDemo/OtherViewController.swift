//
//  OtherViewController.swift
//  PresentationControllerDemo
//
//  Created by Jake Carter on 8/3/18.
//  Copyright © 2018 Jake Carter. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let doneButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped(_:)))
        navigationItem.rightBarButtonItem = doneButtonItem
        
        let togglePresentation = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleButtonTapped(_:)))
        navigationItem.leftBarButtonItem = togglePresentation
    }
    
    @objc func doneButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func toggleButtonTapped(_ sender: UIBarButtonItem) {
        guard let customPresentationController = navigationController?.customPresentationController else { return }
        
        customPresentationController.displayStyle = (customPresentationController.displayStyle == .halfHeight) ? .fullHeight : .halfHeight
    }
}
