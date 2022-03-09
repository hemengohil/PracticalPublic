//
//  CellNews.swift
//  DRCPractical
//
//  Created by Hemen on 09/03/22.
//

import UIKit

class CellNews: UITableViewCell {
    
    static let identifierCell = "CellNews"
    
    
    @IBOutlet var lblTitle : UILabel!
    @IBOutlet var lblLink : UILabel!
    @IBOutlet var lblName : UILabel!
    @IBOutlet var lblDate : UILabel!

    @IBOutlet var imgHead : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
