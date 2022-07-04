//
//  PullRequestModel.swift
//  CometChat
//
//  Created by Angshuman Das on 11/04/1401 AP.
//

import Foundation


// MARK: - PullRequestModel
struct PullRequestModel: Codable {
    var url: String?
    var id: Int?
    var nodeID: String?
    var htmlURL: String?
    var diffURL: String?
    var patchURL: String?
    var issueURL: String?
    var number: Int?
    var state: String?
    var locked: Bool?
    var title: String?
    

    enum CodingKeys: String, CodingKey {
        case url, id
        case nodeID = "node_id"
        case htmlURL = "html_url"
        case diffURL = "diff_url"
        case patchURL = "patch_url"
        case issueURL = "issue_url"
        case number, state, locked, title
    }
}
