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
    var firstNameList = ["Alex", "John", "Kate", "Jack", "Zoe", "Sara"]
    var lastNameList = ["Black", "Orange", "Brown", "White", "Silver", "Gold"]
    var phoneNumberList = ["111", "222", "333", "444", "555", "666"]
    var emailList = ["111@mail.com", "222@mail.com", "333@mail.com", "444@mail.com", "555@mail.com", "666@mail.com"]
    }
    
var firstName = DataManager().firstNameList.randomElement() ?? ""
    var lastName = DataManager().lastNameList.randomElement() ?? ""
    var phoneNumber = DataManager().phoneNumberList.randomElement() ?? ""
    var email = DataManager().emailList.randomElement() ?? ""

var list = [firstName, lastName, phoneNumber, email]
