//
//  VotingTableViewCell.swift
//  prototype
//
//  Created by Developer on 11/19/19.
//  Copyright © 2019 CS Seniors. All rights reserved.
//

import UIKit

class VotingTableViewCell: UITableViewCell {
    static let reuseIdentifier: String = "REUSE_VOTE"

    @IBOutlet weak var VoteScore: UISegmentedControl!
    @IBOutlet weak var ProfessorName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
