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
}

class DataManager {
    enum Contact {
        case firstName, lastName, phoneNumber, email
    }
    
    let firstNameList = ["Alex", "John", "Kate", "Jack", "Zoe", "Sara"]
    let lastNameList = ["Black", "Orange", "Brown", "White", "Silver", "Gold"]
    let phoneNumberList = ["111", "222", "333", "444", "555", "666"]
    let emailList = ["111@mail.com", "222@mail.com", "333@mail.com", "444@mail.com", "555@mail.com", "666@mail.com"]
    
    var firstName: Contact = .firstName
    var lastName: Contact = .lastName
    var phoneNumber: Contact = .phoneNumber
    var email: Contact = .email
    
    init(firstName: Contact) {
        self.firstName = firstNameList.randomElement() as! Contact
    }
    init(lastName: Contact) {
        self.lastName = lastNameList.randomElement() as! Contact
    }
    init(phoneNumber: Contact) {
        self.phoneNumber = phoneNumberList.randomElement() as! Contact
    }
    init(email: Contact) {
        self.email = emailList.randomElement() as! Contact
    }
    
}

extension Person {
    
    static func getContact() -> [Person] {
        var firstName = DataManager(firstName: .firstName) as! String
        var lastName = DataManager(lastName: .lastName) as! String
        var phoneNumber = DataManager(phoneNumber: .phoneNumber) as! String
        var email = DataManager(email: .email) as! String
        
        return [
            Person(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, email: email),
            Person(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, email: email),
            Person(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, email: email),
            Person(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, email: email),
            Person(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, email: email),
            Person(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, email: email)
        ]
    }
}



