//
//  Constant.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 19/01/24.
//

import Foundation
import UIKit

struct Constant{
    //Color
    static let BackgroundColor = "#000000"//Black
    static let CellBackgroundColor = "#000000"//Black
    static let TextColor = "#FFFBF5"//Cream white
    static let ThemeColor = "#BFD8AF"//Green
    static let Silver = "#F5F7F8"
    static let backButtonColor = "#4F6F52"
    
     //SixColors
    static let firstColor = "#B2A4FF"//Light Blue
    static let secondColor = "#FBFFDC"//Light Cyan
    static let thirdColor = "#97FEED"//Light yellow
    static let fourthColor = "#F875AA"//purple
    static let fifthColor = "#EEEDED"//pink
    static let sixthColor = "#96B6C5"//warm
    
    func SixColors()->[UIColor]{
        var colors = [UIColor]()
        colors.append(UIColor(hexString: Constant.firstColor))
        colors.append(UIColor(hexString: Constant.secondColor))
        colors.append(UIColor(hexString: Constant.thirdColor))
        colors.append(UIColor(hexString: Constant.fourthColor))
        colors.append(UIColor(hexString: Constant.fifthColor))
        colors.append(UIColor(hexString: Constant.sixthColor))
        print(colors)
        return colors
    }
    
    //Auth
    static var GithubAuthCode = "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"
    static var UserName = ""
}
