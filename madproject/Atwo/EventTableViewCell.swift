//
//  EventTableViewCell.swift
//  Atwo
//
//  Created by 宇宣 Chen on 2021/1/27.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
