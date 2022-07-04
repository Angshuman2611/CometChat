//
//  LoginViewController.swift
//  CometChat
//
//  Created by Angshuman Das on 12/04/1401 AP.
//

import UIKit
import OAuthSwift

class LoginViewController: UIViewController {
    
    private var oauthswift: OAuth2Swift!
    let viewModel = LoginViewModel()

    lazy var internalWebViewController: WebViewController = {
        let controller = WebViewController()
      
        controller.delegate = self
        controller.viewDidLoad() // allow WebViewController to use this ViewController as parent to be presented
        return controller
    }()


    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
    }
    
    private func setup() {
        
        loginBtn.layer.cornerRadius = 14
        appListener()
    }
    
    private func appListener() {
        viewModel.itemData.bind { res in
            let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func loginTap(_ sender: Any) {
        doOAuthGithub()
    }
    
    func getURLHandler() -> OAuthSwiftURLHandlerType {
          
           if internalWebViewController.parent == nil {
               self.addChild(internalWebViewController)
           }
           return internalWebViewController
          
       }
    
    func doOAuthGithub(){
            let oauthswift = OAuth2Swift(
                consumerKey:    Constants.consumerKey,
                consumerSecret: Constants.consumerSecret,
                authorizeUrl:   Constants.authorizeUrl,
                accessTokenUrl: Constants.accessTokenUrl,
                responseType:   Constants.responseType
            )
            self.oauthswift = oauthswift
            oauthswift.authorizeURLHandler = getURLHandler()
            let state = generateState(withLength: 20)
            let _ = oauthswift.authorize(
                withCallbackURL: URL(string: Constants.authURL)!, scope: "user,repo", state: state) { result in
                switch result {
                case .success(let (credential, _, _)):
                    
                 
                    UserDefaults.accessToken = credential.oauthToken
                   
                    
                    self.viewModel.fetchUser()
                case .failure(let error):
                    print(error.description)
                }
            }
        }

}

extension LoginViewController: OAuthWebViewControllerDelegate {
    func oauthWebViewControllerDidPresent() {
        
    }
    
    func oauthWebViewControllerDidDismiss() {
        
    }
    
    func oauthWebViewControllerWillAppear() {
        
    }
    
    func oauthWebViewControllerDidAppear() {
        
    }
    
    func oauthWebViewControllerWillDisappear() {
        
    }
    
    func oauthWebViewControllerDidDisappear() {
        
    }

}
