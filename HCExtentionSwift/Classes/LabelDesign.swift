//
//  LabelDesign.swift
//  HCExtentionSwift
//
//  Created by Himanshu Chimanji on 08/08/18.
//


import UIKit

@IBDesignable
open class LabelDesign: UILabel {
    
    @IBInspectable var cornerradius : CGFloat = 0
    @IBInspectable var shadowOffSetWidth : CGFloat = 0
    @IBInspectable var boderWidth : CGFloat = 0
    @IBInspectable var boderColor : UIColor = UIColor.clear
    @IBInspectable var shadowOffSetHeigth : CGFloat = 0
    @IBInspectable var shadowsColor : UIColor = UIColor.clear
    @IBInspectable var shadowOpacity : CGFloat = 0
    
    @IBInspectable var topPadding : CGFloat = 0
    @IBInspectable var leftPadding : CGFloat = 0
    @IBInspectable var rightPadding : CGFloat = 0
    @IBInspectable var bottomPadding : CGFloat = 0
    
    override open func layoutSubviews() {
       
        layer.cornerRadius = cornerradius
        layer.borderColor = boderColor.cgColor
        layer.borderWidth = boderWidth
        layer.shadowColor = shadowsColor.cgColor
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeigth)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerradius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = Float(shadowOpacity)
        
        
    }
    
    override open func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topPadding, left: leftPadding, bottom: bottomPadding, right: rightPadding)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override open var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftPadding + rightPadding,
                      height: size.height + topPadding + bottomPadding)
    }
    
}
