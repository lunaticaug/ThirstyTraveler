//
//  DetailProductCell.swift
//  ThirstyTraveler
//
//  Created by 양문영 on 2017. 2. 6..
//  Copyright © 2017년 moonyoung. All rights reserved.
//

import UIKit

class DetailProductCell: UITableViewCell {

    @IBOutlet var product: UILabel!
    @IBOutlet var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
