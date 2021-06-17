//
//  PageOfContact.swift
//  Contact List
//
//  Created by Alexander Kovzhut on 12.06.2021.
//

import UIKit

class PageOfContact: UITableViewController {
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!

    var contact = Person(firstName: "", lastName: "", phoneNumber: "", email: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateSaveButton()
        updateUI()
    }
    
    private func updateSaveButton() {
        let firstNameText = firstNameField.text ?? ""
        let lastNameText = lastNameField.text ?? ""
        let phoneNumberText = phoneNumberField.text ?? ""
        let emailText = emailField.text ?? ""
        
        saveButton.isEnabled = !firstNameText.isEmpty && !lastNameText.isEmpty && !phoneNumberText.isEmpty && !emailText.isEmpty
    }
    
    private func updateUI() {
        firstNameField.text = contact.firstName
        lastNameField.text = contact.lastName
        phoneNumberField.text = contact.phoneNumber
        emailField.text = contact.email
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        updateSaveButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveContact" else { return }

        let firstName = firstNameField.text ?? ""
        let lastName = lastNameField.text ?? ""
        let phoneNumber = phoneNumberField.text ?? ""
        let email = emailField.text ?? ""

        self.contact = Person(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, email: email)
    }
}
