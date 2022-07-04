//
//  ViewController.swift
//  CometChat
//
//  Created by Angshuman Das on 10/04/1401 AP.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var mTableView: UITableView!
    let searchController = UISearchController()
    let viewModel = HomeViewModel()
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.mTableView.reloadData()
    }
    
    private func setup() {
        addNavigationItem()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        self.mTableView.delegate = self
        self.mTableView.dataSource = self
        viewModel.fetchRepos(name: "iOS")
        addListener()
    }
    
    func addNavigationItem() {
        let watchlist = UIBarButtonItem.init(
              title: "Watchlist",
              style: .done,
              target: self,
              action: #selector(rightButtonAction)
        )
        let userRepos = UIBarButtonItem.init(
              title: "My Repo",
              style: .done,
              target: self,
              action: #selector(userRepos)
        )
        self.navigationItem.rightBarButtonItem = watchlist
        self.navigationItem.leftBarButtonItem = userRepos
    }
    
    @objc func rightButtonAction(){
        let vc = UIStoryboard(name: "WatchlistScreen", bundle: nil).instantiateViewController(withIdentifier: "WatchlistViewController") as! WatchlistViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func userRepos(){
        let vc = UIStoryboard(name: "UserRepoScreen", bundle: nil).instantiateViewController(withIdentifier: "UserRepoViewController") as! UserRepoViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
   private func addListener() {
        viewModel.itemData.bind { item in
            if (item?.count != 0) {
                guard let result = item else {
                    return
                }
                self.items = result
                self.mTableView.reloadData()
            }else if item?.count == 0 {
                self.items = []
                self.mTableView.reloadData()
            }
        }
    }

}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchCell
        cell.repoName.text = items[indexPath.row].name
        cell.items = items[indexPath.item]
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "RepoDetails", bundle: nil).instantiateViewController(withIdentifier: "RepoViewController") as! RepoViewController
        vc.itemData = items[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        viewModel.fetchRepos(name: text)
    }
}

extension ViewController: SearchProtocol {
    func addToWatchList(indexPathItem: Item) {
        DatabaseManager.shared.addToWatchList(indexItem: indexPathItem)
    }
}
