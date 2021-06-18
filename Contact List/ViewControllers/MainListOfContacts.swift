//
//  MainListOfContacts.swift
//  Contact List
//
//  Created by Alexander Kovzhut on 12.06.2021.
//

import UIKit

class MainListOfContacts: UITableViewController {
    
    
    var contacts: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveContact" else { return }
        let source = segue.source as! PageOfContact
        let contact = source.contact

        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            contacts[selectedIndexPath.row] = contact
            tableView.reloadRows(at: [selectedIndexPath], with: .fade)
        } else {
            let newIndexPath = IndexPath(row: contacts.count, section: 0)
            contacts.append(contact)
            tableView.insertRows(at: [newIndexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "editContact" else {
            return
        }
        let indexPath = tableView.indexPathForSelectedRow!
        let contact = contacts[indexPath.row]
        let newContact = segue.destination as! PageOfContact
        newContact.contact = contact
        newContact.title = "\(contact.firstName) \(contact.lastName)"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Contact", for: indexPath)
        let contact = contacts[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        content.text = contact.title
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    //Edit button
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
