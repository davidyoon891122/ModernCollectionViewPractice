//
//  PersonData.swift
//  CollectionViewHeader
//
//  Created by jiwon Yoon on 2023/03/16.
//

import Foundation

class PersonData: Hashable {
    var id = UUID()
    
    var name: String
    var number: String
    
    init(name: String, number: String) {
        self.name = name
        self.number = number
    }
    
    static func == (lhs: PersonData, rhs: PersonData) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


extension PersonData {
    static let allPersonData = [
        PersonData(name: "Tom", number: "010-0000-0001"),
        PersonData(name: "Tom1", number: "010-0000-0001"),
        PersonData(name: "Tom2", number: "010-0000-0001"),
        PersonData(name: "Tom3", number: "010-0000-0001"),
        PersonData(name: "Tom4", number: "010-0000-0001"),
        PersonData(name: "Tom5", number: "010-0000-0001"),
        PersonData(name: "Tom6", number: "010-0000-0001"),
        PersonData(name: "Tom7", number: "010-0000-0001"),
        PersonData(name: "Tom8", number: "010-0000-0001"),
        PersonData(name: "Tom9", number: "010-0000-0001"),
        PersonData(name: "Tom10", number: "010-0000-0001"),
        PersonData(name: "Tom11", number: "010-0000-0001"),
        PersonData(name: "Tom12", number: "010-0000-0001"),
        PersonData(name: "Tom13", number: "010-0000-0001"),
        PersonData(name: "Tom14", number: "010-0000-0001"),
        PersonData(name: "Tom15", number: "010-0000-0001"),
        PersonData(name: "Tom16", number: "010-0000-0001"),
        PersonData(name: "Tom17", number: "010-0000-0001"),
        PersonData(name: "Tom18", number: "010-0000-0001"),
        PersonData(name: "Tom19", number: "010-0000-0001"),
    ]
}
