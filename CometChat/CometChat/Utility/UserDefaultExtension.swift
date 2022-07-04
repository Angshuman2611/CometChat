//
//  UserDefaultExtension.swift
//  CometChat
//
//  Created by Angshuman Das on 13/04/1401 AP.
//

import Foundation


extension UserDefaults {
    static var accessToken: String? {
            get {
                UserDefaults.standard.string(forKey: UserDefaultKeys.token.rawValue)
            }
            set {
                UserDefaults.standard.set(newValue, forKey: UserDefaultKeys.token.rawValue)
            }
        }
    
    static var userName: String? {
            get {
                UserDefaults.standard.string(forKey: UserDefaultKeys.userName.rawValue)
            }
            set {
                UserDefaults.standard.set(newValue, forKey: UserDefaultKeys.userName.rawValue)
            }
        }

}
