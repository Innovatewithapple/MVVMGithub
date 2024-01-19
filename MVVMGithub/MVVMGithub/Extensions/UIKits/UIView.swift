//
//  UIView.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 19/01/24.
//

import UIKit
extension UIView {
    
    func addRoundedCorners(radius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
        layer.cornerRadius = radius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        layer.masksToBounds = true
    }
}
