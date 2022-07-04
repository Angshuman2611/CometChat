//
//  WatchlistViewController.swift
//  CometChat
//
//  Created by Angshuman Das on 12/04/1401 AP.
//

import UIKit

class WatchlistViewController: UIViewController {

    @IBOutlet weak var mTableView: UITableView!
    
    let watchlistData = DatabaseManager.shared.fetchWatchList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        mTableView.delegate = self
        mTableView.dataSource = self
    }

}


extension WatchlistViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return watchlistData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WatchlistCell") as! WatchlistCell
        cell.watchText.text = watchlistData[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "RepoDetails", bundle: nil).instantiateViewController(withIdentifier: "RepoViewController") as! RepoViewController
        vc.itemData = watchlistData[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "USERS WATCHLIST"
    }
    
    
}
