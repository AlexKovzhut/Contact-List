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
    
    func set( contacts: Person) {
        self.cellLabel.text = "\(contacts.firstName) \(contacts.lastName)"
    }
    
}
