//
//  YourRidesTableViewCell.swift
//  KaRide
//
//  Created by Elliot Licht on 04/03/2017.
//  Copyright © 2017 Ilia Tikhomirov. All rights reserved.
//

import UIKit

class YourRidesTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarOutlet: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        avatarOutlet.layer.cornerRadius = self.avatarOutlet.frame.size.width / 2;
        self.avatarOutlet.clipsToBounds = true

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
