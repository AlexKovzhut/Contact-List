//
//  DataManager.swift
//  Contact List
//
//  Created by Alexander Kovzhut on 17.06.2021.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    let firstNameList = [
        "Alex", "John", "Kate",
        "Jack", "Zoe", "Sara",
        "Clark", "Oprah", "Denis"
    ]
    
    let lastNameList = [
        "Black", "Orange", "Brown",
        "White", "Silver", "Gold",
        "Blue", "Yellow", "Green"
    ]
    
    let phoneNumberList = [
        "111-333", "222-466", "333-456",
        "444-789", "555-799", "666-334",
        "777-789", "888-799", "999-334"
    ]
    
    let emailList = [
        "111@mail.com", "222@mail.com", "333@mail.com",
        "444@mail.com", "555@mail.com", "666@mail.com",
        "777@mail.com", "888@mail.com", "999@mail.com"
    ]
    
    private init() {}
}
