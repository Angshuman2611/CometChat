//
//  LoginViewModel.swift
//  CometChat
//
//  Created by Angshuman Das on 13/04/1401 AP.
//

import Foundation
import Alamofire

class LoginViewModel {
    
    var itemData: Bindable<UserModel?> = Bindable(nil)
    var error: Bindable<String> = Bindable("")
    
    func fetchUser() {
        let url = Constants.Service.baseURL + Constants.EndPoints.user
        
        AlamoWebServices.shared.getApiWithQueryParams(url: URL(string: url)!, params: nil, type: UserModel.self) { response in
            
            guard let response = response as? UserModel else {
                return
            }
            UserDefaults.userName = response.login
            self.itemData.value = response
        } onFailure: { error in
            self.error.value = "\(error)"
        }

    }

    
}
