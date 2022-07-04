//
//  UserRepoViewController.swift
//  CometChat
//
//  Created by Angshuman Das on 12/04/1401 AP.
//

import UIKit

class UserRepoViewController: UIViewController {
    
    @IBOutlet weak var mTableView: UITableView!
    let viewModel = UserRepoViewModel()
    let searchController = UISearchController()
    var repoModel = [UserRepoModel]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search Repositories"
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        viewModel.fetchRepos(repoPath: "iOSxBlockchain")
        mTableView.delegate = self
        mTableView.dataSource = self
        addListerner()
    }
    
    
    private func addListerner() {
        viewModel.itemData.bind { result in
            if result?.count != 0 {
                self.repoModel = result!
                self.mTableView.reloadData()
            }else if result?.count == 0 {
                self.repoModel = []
                self.mTableView.reloadData()
            }
        }
    }

}

extension UserRepoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserRepoCell") as! UserRepoCell
        cell.repoName.text = repoModel[indexPath.row].name
        return cell
    }
    
    
}

extension UserRepoViewController: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        
         let text = searchController.searchBar.text
        
        if searchController.searchBar.text?.isEmpty == false {
            repoModel = repoModel.filter({ ($0.name!.contains(text!)) })
        }else {
            viewModel.fetchRepos(repoPath: "iOSxBlockchain")
            return
        }
        
        self.mTableView.reloadData()
    }
}
