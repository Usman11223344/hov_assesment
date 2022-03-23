//
//  UserEntity+CoreDataClass.swift
//  
//
//  Created by Usman on 23/03/2022.
//
//

import Foundation
import CoreData


enum DecoderConfigurationError: Error {
  case missingManagedObjectContext
}

@objc(User)
public class User: NSManagedObject, UserProtocol, Codable {

    @NSManaged public var login: String?
    @NSManaged public var id: Int32
    @NSManaged public var organizationsURL: String?
    @NSManaged public var nodeID: String?
    @NSManaged public var avatarURL: String?
    @NSManaged public var gravatarID: String?
    @NSManaged public var url: String?
    @NSManaged public var htmlURL: String?
    @NSManaged public var followersURL: String?
    @NSManaged public var followingURL: String?
    @NSManaged public var gistsURL: String?
    @NSManaged public var starredURL: String?
    @NSManaged public var subscriptionsURL: String?
    @NSManaged public var reposURL: String?
    @NSManaged public var eventsURL: String?
    @NSManaged public var receivedEventsURL: String?
    @NSManaged public var type: String?
    @NSManaged public var siteAdmin: Bool
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.login = try container.decode(String.self, forKey: .login)
        self.id = try container.decode(Int32.self, forKey: .id)
        self.nodeID = try container.decode(String.self, forKey: .nodeID)
        self.avatarURL = try container.decode(String.self, forKey: .avatarURL)
        self.gravatarID = try container.decode(String.self, forKey: .gravatarID)
        self.url = try container.decode(String.self, forKey: .url)
        self.htmlURL = try container.decode(String.self, forKey: .htmlURL)
        self.followersURL = try container.decode(String.self, forKey: .followersURL)
        self.followingURL = try container.decode(String.self, forKey: .followingURL)
        self.gistsURL = try container.decode(String.self, forKey: .gistsURL)
        self.starredURL = try container.decode(String.self, forKey: .starredURL)
        self.subscriptionsURL = try container.decode(String.self, forKey: .subscriptionsURL)
        self.organizationsURL = try container.decode(String.self, forKey: .organizationsURL)
        self.reposURL = try container.decode(String.self, forKey: .reposURL)
        self.eventsURL = try container.decode(String.self, forKey: .eventsURL)
        self.receivedEventsURL = try container.decode(String.self, forKey: .receivedEventsURL)
        self.type = try container.decode(String.self, forKey: .type)
        self.siteAdmin = try container.decode(Bool.self, forKey: .siteAdmin)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(login, forKey: .login)
        try container.encode(id, forKey: .id)
        try container.encode(nodeID, forKey: .nodeID)
        try container.encode(avatarURL, forKey: .avatarURL)
        try container.encode(gravatarID, forKey: .gravatarID)
        try container.encode(url, forKey: .url)
        try container.encode(htmlURL, forKey: .htmlURL)
        try container.encode(followersURL, forKey: .followersURL)
        try container.encode(followingURL, forKey: .followingURL)
        try container.encode(gistsURL, forKey: .gistsURL)
        try container.encode(subscriptionsURL, forKey: .subscriptionsURL)
        try container.encode(organizationsURL, forKey: .organizationsURL)
        try container.encode(reposURL, forKey: .reposURL)
        try container.encode(eventsURL, forKey: .eventsURL)
        try container.encode(receivedEventsURL, forKey: .receivedEventsURL)
        try container.encode(type, forKey: .type)
        try container.encode(siteAdmin, forKey: .siteAdmin)
      }
    

    
}
