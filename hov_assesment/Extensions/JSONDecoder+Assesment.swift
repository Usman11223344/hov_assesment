//
//  JSONDecoder+Assesment.swift
//  hov_assesment
//
//  Created by Usman on 23/03/2022.
//

import Foundation
import CoreData

extension JSONDecoder {
    convenience init(context: NSManagedObjectContext) {
        self.init()
        self.userInfo[.managedObjectContext] = context
    }
}
