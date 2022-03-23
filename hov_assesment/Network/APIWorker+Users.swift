//
//  APIWorker+User.swift
//  Assesment
//
//  Created by Usman on 23/03/2022.
//

import Foundation

extension APIWorker {
 
    static func getUsers( onComplete: @escaping (_ result: NetworkResult<[UserProtocol]?>) -> Void) {
        
        guard let users = try? UserDataStore.store.getAllUser(), users.count > 0 else {
            
            let endPoint = APIEndPoint.Users.users.endPoint
            APIManager.shared.execute(endPoint) { (result: NetworkResult<[User]>) in
                switch result {
                case .success(let data):
                    onComplete(.success(data))
                case .failure(let errorString):
                    onComplete(.failure(errorString))
                }
            }
            return
        }
        onComplete(.success(users))
        
    }
}
