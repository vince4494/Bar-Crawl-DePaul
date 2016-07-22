//
//  KellysCustomTableViewCell.swift
//  BarCrawl_FinalProject
//
//  Created by Vince Zipparro on 2/20/16.
//  Copyright © 2016 Vince Zipparro. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var KellysdealDays: UILabel!
    @IBOutlet weak var McGeesdealDays: UILabel!
    @IBOutlet weak var LionsHeaddealDays: UILabel!
    @IBOutlet weak var MadRiverdealDays:UILabel!
    @IBOutlet weak var DurkinsdealDays:UILabel!
    @IBOutlet weak var HeadQuartersdealDays:UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
