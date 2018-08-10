//
//  TextFieldDesign.swift
//  HCExtentionSwift
//
//  Created by Himanshu Chimanji on 08/08/18.
//
import UIKit

@IBDesignable
open class TextFieldDesign: UITextField {
    
    @IBInspectable var cornerradius : CGFloat = 0
    @IBInspectable var shadowOffSetWidth : CGFloat = 0
    @IBInspectable var boderWidth : CGFloat = 0
    @IBInspectable var boderColor : UIColor = UIColor.clear
    @IBInspectable var shadowOffSetHeigth : CGFloat = 0
    @IBInspectable var shadowColor : UIColor = UIColor.clear
    @IBInspectable var shadowOpacity : CGFloat = 0
    
    @IBInspectable var topPadding : CGFloat = 0
    @IBInspectable var leftPadding : CGFloat = 0
    @IBInspectable var rightPadding : CGFloat = 0
    @IBInspectable var bottomPadding : CGFloat = 0
    
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
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsets(top: topPadding, left: leftPadding, bottom: bottomPadding, right: rightPadding))
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsets(top: topPadding, left: leftPadding, bottom: bottomPadding, right: rightPadding))
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsets(top: topPadding, left: leftPadding, bottom: bottomPadding, right: rightPadding))
    }
    
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: newValue!])
        }
    }
    
}
