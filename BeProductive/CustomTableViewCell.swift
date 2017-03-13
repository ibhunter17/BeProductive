//
//  CustomTableViewCell.swift
//  BeProductive
//
//  Created by Nitish Dang on 2017-03-12.
//  Copyright © 2017 Nitish Dang. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var date: UILabel!
    @IBOutlet var tasklabel: UILabel!
    @IBOutlet var descrlabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
