//
//  AlamoWebServices.swift
//  NewsApp
//
//  Created by Angshuman Das on 06/04/1401 AP.
//

import Foundation
import Alamofire
import SwiftyJSON

class AlamoWebServices {
    
    static let shared = AlamoWebServices()
    
    typealias _onSuccess = ((JSON) -> Void)
    typealias onSuccess = ((Decodable) -> Void)
    typealias onFailure = ((Error) -> Void)

    // GET API (QUERY STRING)
    func getApiWithQueryParams<T: Decodable>(url: URL, params: Parameters, type: T.Type, onSuccess: @escaping onSuccess, onFailure: @escaping onFailure) {
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.queryString, headers: nil).responseJSON { response in
            
            if response.result.isSuccess {
                do{
                    let decodedResponse = try JSONDecoder().decode(T.self, from: response.data!)
                    onSuccess(decodedResponse)
                }catch (let error) {
                    onFailure(error)
                }
            } else if response.result.isFailure {
                onFailure(response.error!)
            }
        }
    }
    
    // POST API (QUERY STRING)
    func postApiWithQueryParams(url: URL, params: Parameters, onSuccess: @escaping _onSuccess, onFailure: @escaping onFailure) {
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.queryString, headers: nil).responseJSON { response in
            
            if response.result.isSuccess {
                onSuccess(JSON(response.result.value!))
            } else if response.result.isFailure {
                onFailure(response.error!)
            }
            
        }
    }
    
    // POST API (HTTP BODY)
    func postApiWithBodyParams(url: URL, params: Parameters, onSuccess: @escaping _onSuccess, onFailure: @escaping onFailure) {
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.httpBody, headers: nil).responseJSON { response in
            
            if response.result.isSuccess {
                onSuccess(JSON(response.result.value!))
            } else if response.result.isFailure {
                onFailure(response.error!)
            }
            
        }
    }

}
