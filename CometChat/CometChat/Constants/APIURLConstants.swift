//
//  NetworkConstants.swift
//  NewsApp
//
//  Created by Angshuman Das on 06/04/1401 AP.
//
import Foundation

extension Constants{
    
    struct Service{
        static var baseURL = "https://api.github.com/"
    }
    
    struct EndPoints{
        static var searchRepositories = "search/repositories"
        static var userRepositories = "users/\(Constants.ownerName!)/repos"
        static var openIssues = "repos/\(Constants.ownerName!)/\(Constants.repoName!)/issues"
        static var pullRequests = "repos/\(Constants.ownerName!)/\(Constants.repoName!)/pulls"
        static var createIssue = "repos/\(Constants.ownerName!)/\(Constants.repoName!)/issues"
    }
}

