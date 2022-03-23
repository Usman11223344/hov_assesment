//
//  UserProfile.swift
//  Assesment
//
//  Created by Usman on 23/03/2022.
//

import Foundation

protocol UserProtocol {
    var login: String? { get }
    var id: Int32 { get }
    var nodeID: String? { get }
    var avatarURL: String? { get }
    var gravatarID: String? { get }
    var url: String? { get }
    var htmlURL: String? { get }
    var followersURL: String? { get }
    var followingURL: String? { get }
    var gistsURL: String? { get }
    var starredURL: String? { get }
    var subscriptionsURL: String? { get }
    var organizationsURL: String? { get }
    var reposURL: String? { get }
    var eventsURL: String? { get }
    var receivedEventsURL: String? { get }
    var type: String? { get }
    var siteAdmin: Bool { get }
}
