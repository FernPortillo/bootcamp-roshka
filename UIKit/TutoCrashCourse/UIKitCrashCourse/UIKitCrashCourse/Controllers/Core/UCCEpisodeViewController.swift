//
//  UCCEpisodeViewController.swift
//  UIKitCrashCourse
//
//  Created by Bootcamp on 2025-11-28.
//

import UIKit


/// Controller que se encarga de buscar y mostrar Episodios
final class UCCEpisodeViewController: UIViewController {

    let icon = "tv"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Episodes"
        navigationItem.largeTitleDisplayMode = .automatic
        // Do any additional setup after loading the view.
    }


}
