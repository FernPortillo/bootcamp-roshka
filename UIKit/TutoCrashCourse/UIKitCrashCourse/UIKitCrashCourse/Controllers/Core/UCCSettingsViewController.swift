//
//  UCCSettingsViewController.swift
//  UIKitCrashCourse
//
//  Created by Bootcamp on 2025-11-28.
//

import UIKit

/// Controller que maneja las opciones y settings de la app.
final class UCCSettingsViewController: UIViewController {

    let icon = "gear"
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Settings"
        navigationItem.largeTitleDisplayMode = .automatic

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
