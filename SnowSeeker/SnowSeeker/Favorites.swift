//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Burhan Dündar on 29.09.2022.
//

import Foundation

class Favorites: ObservableObject {
    private var resorts: Set<String>
    private let saveKey = "Favorites"
    
    init() {
        resorts = []
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        objectWillChange.send() // bu nedir ?
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        // write out our data
    }
}
