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
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
