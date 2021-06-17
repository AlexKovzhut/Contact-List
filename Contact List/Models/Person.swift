//
//  Person.swift
//  Contact List
//
//  Created by Alexander Kovzhut on 08.06.2021.
//

struct Person {
    var firstName: String
    var lastName: String
    var phoneNumber: String
    var email: String
    
    var title: String {
        "\(firstName) \(lastName)"
    }
    
}

extension Person {
    static func getContactList() -> [Person] {
        
        var persons: [Person] = []
        
        let firstNames = DataManager.shared.firstNameList.shuffled()
        let lastNames = DataManager.shared.lastNameList.shuffled()
        let phoneNumbers = DataManager.shared.phoneNumberList.shuffled()
        let emails = DataManager.shared.emailList.shuffled()
        
        let iterationCount = min(
            firstNames.count,
            lastNames.count,
            phoneNumbers.count,
            emails.count
        ) - 1
        
        for index in 1...iterationCount {
            let person = Person(
                firstName: firstNames[index],
                lastName: lastNames[index],
                phoneNumber: phoneNumbers[index],
                email: emails[index]
            )
            
            persons.append(person)
        }
        
        return persons
    }
}



