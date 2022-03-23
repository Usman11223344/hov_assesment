//
//  UserProfile+EndPoint.swift
//  Assesment
//
//  Created by Usman on 23/03/2022.
//

import Foundation

extension APIEndPoint {
    
    enum Users {
        case users
        
        var endPoint: Endpoint {
            
            switch self {
            case .users:
                return APIEndPoint.init(method: .get, resourcePath: "users")
            }
        }
    }
    
}
