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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateSaveButton()

    }
    
    private func updateSaveButton() {
        let firstName = firstNameField.text ?? ""
        let lastName  = lastNameField.text ?? ""
        let phoneNumber = phoneNumberField.text ?? ""
        let email = emailField.text ?? ""
        
        saveButton.isEnabled = !firstName.isEmpty && !lastName.isEmpty && !phoneNumber.isEmpty && !email.isEmpty
    }

    @IBAction func textFieldChanged(_ sender: UITextField) {
        updateSaveButton()
    }
    
    
}










