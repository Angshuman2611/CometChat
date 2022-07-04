//
//  HomeViewModel.swift
//  CometChat
//
//  Created by Angshuman Das on 10/04/1401 AP.
//

import Foundation
import Alamofire

class HomeViewModel {
    
    var itemData: Bindable<[Item]?> = Bindable(nil)
    var error: Bindable<String> = Bindable("")
    
    func fetchRepos(name: String) {
        let url = Constants.Service.baseURL + Constants.EndPoints.searchRepositories
        guard let access = UserDefaults.accessToken else {
            return
        }
        let param: Parameters = [
            "Authorization": "token \(access)",
            "q": name
        ]
        AlamoWebServices.shared.getApiWithQueryParams(url: URL(string: url)!, params: param, type: HomeFeedModel.self) { response in
            
            guard let response = response as? HomeFeedModel else {
                return
            }
            self.itemData.value = response.items
        } onFailure: { error in
            self.error.value = "\(error)"
        }

    }
}
