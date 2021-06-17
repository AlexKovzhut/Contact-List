//
//  SecondaryListOfContacts.swift
//  Contact List
//
//  Created by Alexander Kovzhut on 12.06.2021.
//

import UIKit

class SecondaryListOfContacts: UITableViewController {
    
    var contacts: [Person] = Person.getContactList()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Contacts List"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showCell", for: indexPath)
        
        let contact = contacts[indexPath.section]
        var content = cell.defaultContentConfiguration()
        
        switch indexPath.row {
        case 0:
            content.text = contact.phoneNumber
        default:
            content.text = contact.email
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
}
