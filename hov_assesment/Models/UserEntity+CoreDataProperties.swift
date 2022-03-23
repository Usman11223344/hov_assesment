//
//  UserEntity+CoreDataProperties.swift
//  
//
//  Created by Usman on 23/03/2022.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }
}
