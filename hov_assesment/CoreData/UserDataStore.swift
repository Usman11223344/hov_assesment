//
//  UserDataStore.swift
//  hov_assesment
//
//  Created by Usman on 23/03/2022.
//

import Foundation

class UserDataStore {
    
    static let store = UserDataStore()
    
    private init() {
        
    }
    
    func getAllUser() throws -> [User]? {
        
        let fetchRequest = User.fetchRequest()
        let managedObjectContext = CoreDataStack.manager.viewContext
        guard let users = try? managedObjectContext.fetch(fetchRequest) else { return nil }
        return users
    }
    
}
