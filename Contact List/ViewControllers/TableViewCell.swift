//
//  TableViewCell.swift
//  Contact List
//
//  Created by Alexander Kovzhut on 08.06.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var cellLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
         
    }
    
    func set(contact: Person) {
        self.cellLabel.text = contact.firstName + " " + contact.lastName
    }
    
    

}
