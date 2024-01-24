//
//  UIView.swift
//  MVVMGithub
//
//  Created by Himanshu vyas on 19/01/24.
//

import UIKit
extension UIView {
    func addRoundedCorners(radius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
        animatePropertyChange {
            self.layer.cornerRadius = radius
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = borderColor.cgColor
        }
        animateBorderWidthChange(newWidth: borderWidth)
    }
    
    private func animatePropertyChange(_ changes: @escaping () -> Void) {
        UIView.animate(withDuration: 0.3) {
            changes()
        }
    }
    
    private func animateBorderWidthChange(newWidth: CGFloat) {
        let animation = CABasicAnimation(keyPath: "borderWidth")
        animation.fromValue = layer.borderWidth
        animation.toValue = newWidth
        animation.duration = 0.3
        layer.borderWidth = newWidth
        layer.add(animation, forKey: "borderWidthAnimation")
    }
}


class RoundedBorderView: UIView {

    // Properties to control the border appearance
    var cornerRadius: CGFloat = 0 {
        didSet {
            animatePropertyChange {
                self.layer.cornerRadius = self.cornerRadius
            }
        }
    }

    var borderWidth: CGFloat = 0 {
        didSet {
            animateBorderWidthChange()
        }
    }

    var borderColor: UIColor = .clear {
        didSet {
            animatePropertyChange {
                self.layer.borderColor = self.borderColor.cgColor
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        // Set initial properties
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }

    private func animatePropertyChange(_ changes: @escaping () -> Void) {
        UIView.animate(withDuration: 0.3) {
            changes()
        }
    }

    private func animateBorderWidthChange() {
        let animation = CABasicAnimation(keyPath: "borderWidth")
        animation.fromValue = layer.borderWidth
        animation.toValue = borderWidth
        animation.duration = 0.3
        layer.borderWidth = borderWidth
        layer.add(animation, forKey: "borderWidthAnimation")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // Update layer properties
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}
