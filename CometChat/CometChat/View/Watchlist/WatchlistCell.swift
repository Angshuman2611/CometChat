//
//  WatchlistCell.swift
//  CometChat
//
//  Created by Angshuman Das on 12/04/1401 AP.
//

import UIKit

class WatchlistCell: UITableViewCell {

    @IBOutlet weak var watchText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
