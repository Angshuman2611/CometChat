//
//  RepoViewController.swift
//  CometChat
//
//  Created by Angshuman Das on 10/04/1401 AP.
//

import UIKit

class RepoViewController: UIViewController {
    
    var itemData = Item()
    var repoDetailModel = [RepoDetailModel]()
    let viewModel = RepoDetailViewModel()

    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var prCountText: UILabel!
    @IBOutlet weak var repoName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.fetchRepos(repoPath: itemData.fullName!)
        viewModel.fetchPRs(repoPath: itemData.fullName!)
        addListener()
    }
    
    private func setup() {
        mTableView.delegate = self
        mTableView.dataSource = self
        navigationController?.navigationBar.isHidden = true
        repoName.text = "Repo name: \(itemData.name ?? "")"
        viewModel.fetchRepos(repoPath: itemData.fullName!)
        viewModel.fetchPRs(repoPath: itemData.fullName!)
        addListener()
    }
    
   private func addListener() {
        viewModel.itemData.bind { result in
            if result?.count != 0 {
                self.repoDetailModel = result!
                self.mTableView.reloadData()
            }else if result?.count == 0 {
                self.repoDetailModel = []
                self.mTableView.reloadData()
            }
        }
        
        viewModel.pullData.bind { result in
            if result?.count != 0 {
                self.prCountText.text = "PR count: \(result!.count)"
            }else if result?.count == 0 {
                self.prCountText.text = "PR count: \(result!.count)"
            }
        }
    }

    @IBAction func backBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.navigationBar.isHidden = false
    }
    @IBAction func Createissue(_ sender: UIButton) {
        let vc = UIStoryboard(name: "CreateIssue", bundle: nil).instantiateViewController(withIdentifier: "CreateIssueViewController") as! CreateIssueViewController
        vc.itemData = self.itemData
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension RepoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoDetailModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IssuesCell", for: indexPath) as! IssuesCell
        cell.issueText.text = repoDetailModel[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "ISSUES"
    }
    
    
}
