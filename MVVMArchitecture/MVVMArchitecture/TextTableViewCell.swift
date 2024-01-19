//
//  TextTableViewCell.swift
//  MVVMArchitecture
//
//  Created by Himanshu vyas on 19/01/24.
//

import UIKit

class TextTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbl:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
