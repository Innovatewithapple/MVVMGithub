//
//  UIImage.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 19/01/24.
//

import UIKit
extension UIImage {
    
    func withRoundedCorners(radius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) -> UIImage {
        let image = withRenderingMode(.alwaysOriginal)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let context = UIGraphicsGetCurrentContext()!
        
        context.scaleBy(x: 1, y: -1)
        context.translateBy(x: 0, y: -rect.size.height)
        
        let path = UIBezierPath(roundedRect: rect.insetBy(dx: borderWidth / 2, dy: borderWidth / 2), cornerRadius: radius)
        context.setStrokeColor(borderColor.cgColor)
        path.lineWidth = borderWidth
        path.stroke()
        
        context.addPath(path.cgPath)
        context.clip()
        
        image.draw(in: rect)
        
        let result = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return result
    }
}
