//
//  CharacterListViewViewModel.swift
//  UIKitCrashCourse
//
//  Created by Bootcamp on 2025-11-28.
//

import Foundation

struct CharacterListViewViewModel {
    func fetchCharacters(){
        UCCService.shared.execute(.listCharacters, expecting: UCCGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
