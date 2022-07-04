//
//  UserRepoViewModel.swift
//  CometChat
//
//  Created by Angshuman Das on 12/04/1401 AP.
//

import Foundation
import Alamofire

class UserRepoViewModel {
    
    var itemData: Bindable<[UserRepoModel]?> = Bindable(nil)
    var error: Bindable<String> = Bindable("")
    
    func fetchRepos(repoPath: String) {
        // iOSxBlockchain/GenericAPI
        
        let url = Constants.Service.baseURL + Constants.Module.users + repoPath + Constants.EndPoints.userRepositories
        print(url)
        let params: Parameters = [
                "sort": "created"
        ]
       
        AlamoWebServices.shared.getApiWithQueryParams(url: URL(string: url)!, params: params, type: [UserRepoModel].self) { response in
            print(response)
            guard let response = response as? [UserRepoModel] else {
                return
            }
            self.itemData.value = response
        } onFailure: { error in
            self.error.value = "\(error)"
        }

    }
    
}
