//
//  TabBarController.swift
//  Contact List
//
//  Created by Alexander Kovzhut on 18.06.2021.
//

import UIKit

class TabBarView: UITabBarController {
    
    let contacts = Person.getContactList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers(with: contacts)
    }
    
    private func setupViewControllers(with contacts: [Person]) {
        let listVC = viewControllers?.first as! MainListOfContacts
        let sectionVC = viewControllers?.last as! SecondaryListOfContacts
        
        listVC.contacts = contacts
        sectionVC.contacts = contacts
    }
}
