//
//  CreateIssueViewModel.swift
//  CometChat
//
//  Created by Angshuman Das on 12/04/1401 AP.
//

import Foundation
import Alamofire
import SwiftyJSON

class CreateIssueViewModel {
    
   
    var itemData: Bindable<JSON?> = Bindable(nil)
    var error: Bindable<String> = Bindable("")
    
    func createIssue(repoPath: String, title: String, body: String) {
        // iOSxBlockchain/GenericAPI
        
        let url = Constants.Service.baseURL + Constants.Module.repo + repoPath + Constants.EndPoints.createIssue
        
        let params: Parameters = [
                "title": title,
                "body": body
        ]
       
        AlamoWebServices.shared.postApiWithBodyParams(url: URL(string: url)!, params: params) { response in
            self.itemData.value = response
        } onFailure: { error in
            self.error.value = "\(error)"
        }


    }
   
    
}
