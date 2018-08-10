//
//  ButtonDesign.swift
//  HCExtentionSwift
//
//  Created by Himanshu Chimanji on 08/08/18.
//

import UIKit

@IBDesignable
open class ButtonDesign: UIButton {
    
    @IBInspectable var cornerradius : CGFloat = 0
    @IBInspectable var shadowOffSetWidth : CGFloat = 0
    @IBInspectable var boderWidth : CGFloat = 0
    @IBInspectable var boderColor : UIColor = UIColor.clear
    @IBInspectable var shadowOffSetHeigth : CGFloat = 0
    @IBInspectable var shadowColor : UIColor = UIColor.clear
    @IBInspectable var shadowOpacity : CGFloat = 0
    
    override open func draw(_ rect: CGRect) {
        
        layer.cornerRadius = cornerradius
        layer.borderColor = boderColor.cgColor
        layer.borderWidth = boderWidth
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeigth)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerradius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = Float(shadowOpacity)
        
        
    }
    
    
    
}
