//
//  Headers.swift
//  CometChat
//
//  Created by Angshuman Das on 12/04/1401 AP.
//

import Foundation
import Alamofire

struct AlamoHeaders {
    
    static var headers: HTTPHeaders = ["Authorization":"Bearer \(UserDefaults.accessToken!)"]
}
