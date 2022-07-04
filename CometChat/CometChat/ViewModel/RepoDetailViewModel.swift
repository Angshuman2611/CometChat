//
//  RepoDetailViewModel.swift
//  CometChat
//
//  Created by Angshuman Das on 11/04/1401 AP.
//

import Foundation
import Alamofire

class RepoDetailViewModel {
    
    var pullData: Bindable<[PullRequestModel]?> = Bindable(nil)
    var itemData: Bindable<[RepoDetailModel]?> = Bindable(nil)
    var error: Bindable<String> = Bindable("")
    
    func fetchRepos(repoPath: String) {
        let url = Constants.Service.baseURL + Constants.Module.repo + repoPath + Constants.EndPoints.openIssues
        guard let access = UserDefaults.accessToken else {
                    return
                }
        let param: Parameters = [
            "Authorization": "token \(access)",
            "per_page": 5
        ]
        AlamoWebServices.shared.getApiWithQueryParams(url: URL(string: url)!, params: param, type: [RepoDetailModel].self) { response in
            
            guard let response = response as? [RepoDetailModel] else {
                return
            }
            self.itemData.value = response
        } onFailure: { error in
            self.error.value = "\(error)"
        }

    }
    
    func fetchPRs(repoPath: String) {
        let url = Constants.Service.baseURL + Constants.Module.repo + repoPath + Constants.EndPoints.pullRequests
        guard let access = UserDefaults.accessToken else {
                    return
                }
        let param: Parameters = [
            "Authorization": "token \(access)",
            "state": "open"
        ]
        AlamoWebServices.shared.getApiWithQueryParams(url: URL(string: url)!, params: param, type: [PullRequestModel].self) { response in
            
            guard let response = response as? [PullRequestModel] else {
                return
            }
            self.pullData.value = response
        } onFailure: { error in
            self.error.value = "\(error)"
        }
    }
    
}
