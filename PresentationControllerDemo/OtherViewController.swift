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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let customPresentationController = navigationController?.customPresentationController {
            navigationItem.leftBarButtonItem = customPresentationController.toggleHeightButtonItem
        }
    }
    
    @objc func doneButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
