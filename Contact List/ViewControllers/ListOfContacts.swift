//
//  ListOfContacts.swift
//  Contact List
//
//  Created by Alexander Kovzhut on 07.06.2021.
//

import UIKit

class ListOfContacts: UITableViewController {
    
    var contacts = [
        Person(firstName: "Elon", lastName: "Mask", email: "spacex@mail.com", phoneNumber: "999666"),
        Person(firstName: "Elon", lastName: "Mask", email: "spacex@mail.com", phoneNumber: "999666"),
        Person(firstName: "Elon", lastName: "Mask", email: "spacex@mail.com", phoneNumber: "999666"),
        Person(firstName: "Elon", lastName: "Mask", email: "spacex@mail.com", phoneNumber: "999666"),
        Person(firstName: "Elon", lastName: "Mask", email: "spacex@mail.com", phoneNumber: "999666"),
        Person(firstName: "Elon", lastName: "Mask", email: "spacex@mail.com", phoneNumber: "999666")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.tabBarController?.title  = "Contacts"
        self.tabBarController?.navigationItem.leftBarButtonItem = self.editButtonItem
        
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        guard segue.identifier == "saveSegue" else { return }
        
        let sourceVC = segue.source as! OverviewListOfContacts
        let contact = sourceVC.contact
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            contacts[selectedIndexPath.row] = contact
        } else {
            let newIndexPath = IndexPath(row: contacts.count, section: 0)
            contacts.append(contact)
            tableView.insertRows(at: [newIndexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "editContact" else { return }
        let indexPath = tableView.indexPathForSelectedRow!
        let contact = contacts[indexPath.row]
        let navigationVC = segue.destination
        let newContactVC = navigationVC as! OverviewListOfContacts
        newContactVC.contact = contact
        newContactVC.title = "Edit"
        
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Contact", for: indexPath) as! TableViewCell
        let contact = contacts[indexPath.row]
        
        cell.set(contact: contact)
        

        return cell
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedContact = contacts.remove(at: sourceIndexPath.row)
        contacts.insert(movedContact, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    
    
}
