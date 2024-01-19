//
//  ImageTextTableViewCell.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 18/01/24.
//

import UIKit

class ImageTextTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainView:UIView!
    @IBOutlet weak var img:UIImageView!
    @IBOutlet weak var labelValue:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    
        // Initialization code
    }
    
    func configure(info:(avatar:String?,name:String?)){
        //Background
        self.mainView.backgroundColor = UIColor(hexString: Constant.BackgroundColor)
        self.contentView.backgroundColor = UIColor(hexString: Constant.BackgroundColor)
        
        //Text
        self.labelValue.text = info.name?.uppercased()
        self.labelValue.textColor = UIColor(hexString: Constant.TextColor)
        self.labelValue.font = UIFont.systemFont(ofSize: 19.0, weight: .medium)
        
        //Image
        
        Services.sharedInstance.HandleImage(imageURL: info.avatar ?? "") { image in
            DispatchQueue.main.async {
                self.img.image = image ?? nil
                self.img.contentMode = .scaleAspectFill
                self.img.addRoundedCorners(radius: self.img.bounds.width/2, borderWidth: 4, borderColor: UIColor(hexString: Constant.ThemeColor))
            }
        }
    }
}
