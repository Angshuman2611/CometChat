//
//  SearchCell.swift
//  CometChat
//
//  Created by Angshuman Das on 10/04/1401 AP.
//

import UIKit

protocol SearchProtocol {
    func addToWatchList(indexPathItem: Item)
}

class SearchCell: UITableViewCell {

    @IBOutlet weak var repoName: UILabel!
    var items = Item()
    var delegate: SearchProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func WatchlistBtn(_ sender: UIButton) {
        self.delegate?.addToWatchList(indexPathItem: items)
    }
    
}
