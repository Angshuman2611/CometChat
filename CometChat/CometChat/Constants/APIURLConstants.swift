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
    
    struct Module {
        static var repo = "repos/"
        static var users = "users/"
    }
    
    struct EndPoints{
        static var searchRepositories = "search/repositories"
        static var userRepositories = "/repos"
        static var openIssues = "/issues"
        static var pullRequests = "/pulls"
        static var createIssue = "/issues"
        static var user = "user"
    }
}

