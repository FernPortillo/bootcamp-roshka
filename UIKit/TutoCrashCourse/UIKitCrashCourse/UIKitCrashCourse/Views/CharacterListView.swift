//
//  CharacterListView.swift
//  UIKitCrashCourse
//
//  Created by Bootcamp on 2025-11-28.
//

import UIKit

    /// View que maneja mostrar personajes, el loading, etc
final class CharacterListView : UIView {
    
    private let viewModel = CharacterListViewViewModel()
    
    private let spinner : UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        
        return spinner
    }()
    
    private let tableView = UITableView()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .blue
        addSubview(spinner)
        
        addConstraints()
        
        spinner.startAnimating()
        viewModel.fetchCharacters()
        
        setupTableView()
        addSubviews()
        addConstraints()
        
    }
    
    private func addSubviews(){
        addSubview(tableView)
        addSubview(spinner)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupTableView() {
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CharacterCell")
        }
    
}


