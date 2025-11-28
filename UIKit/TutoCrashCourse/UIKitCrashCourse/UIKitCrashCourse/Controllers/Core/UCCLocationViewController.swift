//
//  UCCLocationViewController.swift
//  UIKitCrashCourse
//
//  Created by Bootcamp on 2025-11-28.
//

import UIKit


/// Controller que se encarga de buscar y mostrar Locations
final class UCCLocationViewController: UIViewController {

    let icon = "globe"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Location"
        navigationItem.largeTitleDisplayMode = .automatic
        // Do any additional setup after loading the view.
    }
    
}
