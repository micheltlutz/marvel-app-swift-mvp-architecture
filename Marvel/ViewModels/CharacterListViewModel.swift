//
//  CharacterListViewModel.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import UIKit
import Foundation

class CharacterListViewModel {
    
    private let characterService = CharacterService()
    private let limit = 20
    private let footerHeigth = CGFloat(44)
    private var offset = 0
    private var loadingActive = false
    private var characters = [Character]()
    private var totalCharacters = 0
    
    
    func load(success: @escaping() -> Void, failure: @escaping(_ error: String) -> Void) {
        if !loadingActive && !checkAlreadyLoadedAll() {
            characterService.getAllWithPagination(offset: String(offset), limit: String(limit), success: { [weak self] (characters, totalCharacters) in
                self?.totalCharacters = totalCharacters
                self?.characters.append(contentsOf: characters)
                self?.loadingActive = false
                self?.offset += self?.limit ?? 0
                success()
            }) { [weak self] (error) in
                self?.loadingActive = false
                failure(error);
            }
            loadingActive = true
        }
    }
    
    func get(index: Int) -> Character {
        return characters[index]
    }
    
    func count() -> Int {
        return characters.count
    }
    
    func checkAlreadyLoadedAll() -> Bool {
        if totalCharacters > 0 && characters.count >= totalCharacters {
            return true
        }
        return false
    }
    
    func heightFooter() -> CGFloat {
        if checkAlreadyLoadedAll() {
            return 0
        }
        return footerHeigth
    }
    
}