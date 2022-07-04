//
//  UserRepoModel.swift
//  CometChat
//
//  Created by Angshuman Das on 12/04/1401 AP.
//

import Foundation


// MARK: - UserRepoModel
struct UserRepoModel: Codable {
    var id: Int?
    var nodeID, name, fullName: String?
    var homeFeedModelPrivate: Bool?
    var owner: Owner?
    var htmlURL: String?
    var homeFeedModelDescription: String?
    var fork: Bool?
    var url, forksURL: String?
    

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case homeFeedModelPrivate = "private"
        case owner
        case htmlURL = "html_url"
        case homeFeedModelDescription = "description"
        case fork, url
       
    }
}

