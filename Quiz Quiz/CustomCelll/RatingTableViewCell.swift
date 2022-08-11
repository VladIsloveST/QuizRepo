//
//  RatingTableViewCell.swift
//  Quiz Quiz
//
//  Created by Mac on 01.08.2022.
//

import UIKit

class RatingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var nameSurnameLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
