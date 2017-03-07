//
//  RideTableViewCell.swift
//  KaRide
//
//  Created by Elliot Licht on 01/03/2017.
//  Copyright © 2017 Ilia Tikhomirov. All rights reserved.
//

import UIKit

class RideTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarOutlet: UIImageView!
    @IBOutlet weak var depTimeLabel: UILabel!
    @IBOutlet weak var arTimeLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
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
