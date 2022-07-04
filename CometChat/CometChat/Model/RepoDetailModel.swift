//
//  RepoDetailModel.swift
//  CometChat
//
//  Created by Angshuman Das on 11/04/1401 AP.
//

import Foundation


// MARK: - RepoDetailModel
struct RepoDetailModel: Codable {
    var url, repositoryURL: String?
    var labelsURL: String?
    var commentsURL, eventsURL, htmlURL: String?
    var id: Int?
    var nodeID: String?
    var number: Int?
    var title: String?
    var user: User?
    var state: String?
    var locked: Bool?
    var comments: Int?
    var createdAt, updatedAt: String?

    var authorAssociation: String?
  
    var draft: Bool?
    var pullRequest: PullRequest?
    var body: String?
    var reactions: Reactions?
    var timelineURL: String?
   

    enum CodingKeys: String, CodingKey {
        case url
        case repositoryURL = "repository_url"
        case labelsURL = "labels_url"
        case commentsURL = "comments_url"
        case eventsURL = "events_url"
        case htmlURL = "html_url"
        case id
        case nodeID = "node_id"
        case number, title, user, state, locked, comments
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case authorAssociation = "author_association"
        case draft
        case pullRequest = "pull_request"
        case body, reactions
        case timelineURL = "timeline_url"
    }
}

// MARK: - PullRequest
struct PullRequest: Codable {
    var url, htmlURL: String?
    var diffURL: String?
    var patchURL: String?

    enum CodingKeys: String, CodingKey {
        case url
        case htmlURL = "html_url"
        case diffURL = "diff_url"
        case patchURL = "patch_url"
    }
}

// MARK: - Reactions
struct Reactions: Codable {
    var url: String?
    var totalCount, the1, reactions1, laugh: Int?
    var hooray, confused, heart, rocket: Int?
    var eyes: Int?

    enum CodingKeys: String, CodingKey {
        case url
        case totalCount = "total_count"
        case the1 = "+1"
        case reactions1 = "-1"
        case laugh, hooray, confused, heart, rocket, eyes
    }
}

// MARK: - User
struct User: Codable {
    var login: String?
    var id: Int?
    var nodeID: String?
    var avatarURL: String?
    var gravatarID: String?
    var url, htmlURL, followersURL: String?
    var followingURL, gistsURL, starredURL: String?
    var subscriptionsURL, organizationsURL, reposURL: String?
    var eventsURL: String?
    var receivedEventsURL: String?
    var type: String?
    var siteAdmin: Bool?

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
}

