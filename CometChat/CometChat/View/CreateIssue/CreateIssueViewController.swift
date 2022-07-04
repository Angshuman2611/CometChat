//
//  CreateIssueViewController.swift
//  CometChat
//
//  Created by Angshuman Das on 12/04/1401 AP.
//

import UIKit


class CreateIssueViewController: UIViewController {
    var itemData = Item()
    
    let viewModel = CreateIssueViewModel()
    
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addListener()
    }
    
    private func setup() {
        descriptionText.layer.borderWidth = 1
        descriptionText.layer.borderColor = UIColor.gray.cgColor
        createBtn.layer.cornerRadius = 18
        activityLoader.isHidden = true
    }
    
    private func addListener() {
         viewModel.itemData.bind { result in
             DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                 self.activityLoader.stopAnimating()
                 self.navigationController?.popViewController(animated: true)
             }
         }
         
        
     }
    
    
    @IBAction func bckBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func CreateBtnAction(_ sender: UIButton) {
        if titleText.text != "" && descriptionText.text != "" {
            self.activityLoader.isHidden = false
            self.activityLoader.startAnimating()
            viewModel.createIssue(repoPath: itemData.fullName!, title: titleText.text!, body: descriptionText.text!)
        }else {
            print("Can't be empty")
        }
        
    }
    
    

}
