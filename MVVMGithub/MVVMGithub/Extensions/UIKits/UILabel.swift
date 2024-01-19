//
//  UILabel.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 19/01/24.
//

import UIKit
extension UILabel {
    func setAttributedText(firstPart: String, secondPart: String) {
        let combinedString = "\(firstPart)\(secondPart)"
        let attributedString = NSMutableAttributedString(string: combinedString)

        let firstPartAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20, weight: .bold)
            // Add any other styling attributes for the first part
        ]

        let secondPartAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .semibold),
            // Add any other styling attributes for the second part
        ]

        attributedString.addAttributes(firstPartAttributes, range: NSRange(location: 0, length: firstPart.count))
        attributedString.addAttributes(secondPartAttributes, range: NSRange(location: firstPart.count, length: secondPart.count))

        self.attributedText = attributedString
    }
}
