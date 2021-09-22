//
//  EventCell.swift
//  Atwo
//
//  Created by 宇宣 Chen on 2021/1/30.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var taskItem: UILabel!
    @IBOutlet weak var locationItem: UILabel!
    @IBOutlet weak var datetimeItem: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
