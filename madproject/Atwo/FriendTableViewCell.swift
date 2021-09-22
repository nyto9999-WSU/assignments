//
//  FriendTableViewCell.swift
//  Atwo
//
//  Created by 宇宣 Chen on 2021/1/21.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var friendImage: UIImageView!
    
    @IBOutlet weak var friendFn: UILabel!
    @IBOutlet weak var friendLn: UILabel!
    @IBOutlet weak var friendAge: UILabel!
    @IBOutlet weak var friendGender: UILabel!
 
    @IBOutlet weak var friendAdrs: UITextView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
