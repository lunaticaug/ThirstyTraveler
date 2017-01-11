//
//  favobeenTableViewCell.swift
//  ThirstyTraveler
//
//  Created by 양문영 on 2016. 8. 22..
//  Copyright © 2016년 moonyoung. All rights reserved.
//

import UIKit

class favobeenTableViewCell: UITableViewCell {
    @IBOutlet var beerplaceImage: UIImageView!
    @IBOutlet var beerplaceName: UILabel!
    @IBOutlet var beerplaceAddress: UILabel!
    @IBOutlet var beerplaceRatings: UILabel!
    @IBOutlet var beerplaceType: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


/* 요이요이요이요 이천십칠년 일월 십일일 */ 
