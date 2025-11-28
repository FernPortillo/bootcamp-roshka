//
//  UCCCharacterViewController.swift
//  UIKitCrashCourse
//
//  Created by Bootcamp on 2025-11-28.
//

import UIKit

/// Controller que se encarga de buscar y mostrar Characters
final class UCCCharacterViewController: UIViewController {
    
    let icon : String = "person"
    private let characterListView = CharacterListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Character"
        navigationItem.largeTitleDisplayMode = .automatic
        
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
