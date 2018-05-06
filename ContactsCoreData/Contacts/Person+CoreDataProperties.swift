//
//  Person+CoreDataProperties.swift
//  Contacts
//
//  Created by Zhanserik on 6/26/17.
//  Copyright © 2017 Kenes Inc. All rights reserved.
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var phone: String?

}
