//
//  OverviewListOfContacts.swift
//  Contact List
//
//  Created by Alexander Kovzhut on 07.06.2021.
//

import UIKit

class OverviewListOfContacts: UITableViewController {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var contact = Person(firstName: "", lastName: "", email: "", phoneNumber: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateSaveButton()
        updateUI()
    }
    
    private func updateSaveButton() {
        let firstName = firstNameField.text ?? ""
        let lastName  = lastNameField.text ?? ""
        let phoneNumber = phoneNumberField.text ?? ""
        let email = emailField.text ?? ""
        
        saveButton.isEnabled = !firstName.isEmpty && !lastName.isEmpty && !phoneNumber.isEmpty && !email.isEmpty
    }
    
    private func updateUI() {
        firstNameField.text = contact.firstName
        lastNameField.text = contact.lastName
        phoneNumberField.text = contact.phoneNumber
        emailField.text = contact.email
    }
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
        updateSaveButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveSegue" else { return }
        
        let firstNameSave = firstNameField.text ?? ""
        let lastNameSave = lastNameField.text ?? ""
        let phoneNumberSave = phoneNumberField.text ?? ""
        let emailSave = emailField.text ?? ""
        
        self.contact = Person(firstName: firstNameSave, lastName: lastNameSave, email: phoneNumberSave, phoneNumber: emailSave)
    }
    
}










