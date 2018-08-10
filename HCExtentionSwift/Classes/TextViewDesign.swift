//
//  TextViewDesign.swift
//  HCExtentionSwift
//
//  Created by Himanshu Chimanji on 08/08/18.
//


import UIKit

@IBDesignable
open class TextViewDesign: UITextView  {
    
    @IBInspectable var cornerradius : CGFloat = 0
    @IBInspectable var boderWidth : CGFloat = 0
    @IBInspectable var boderColor : UIColor = UIColor.clear
    
    @IBInspectable var topPadding : CGFloat = 0
    @IBInspectable var leftPadding : CGFloat = 0
    @IBInspectable var rightPadding : CGFloat = 0
    @IBInspectable var bottomPadding : CGFloat = 0
    
    
    public struct Constants {
        static let defaultiOSPlaceholderColor = UIColor(red: 0.0, green: 0.0, blue: 0.0980392, alpha: 0.22)
    }
    open let placeholderLabel: UILabel = UILabel()
    
    public var placeholderLabelConstraints = [NSLayoutConstraint]()
    
    @IBInspectable open var placeholder: String = "" {
        didSet {
            placeholderLabel.text = placeholder
        }
    }
    
    @IBInspectable open var placeholderColor: UIColor = TextViewDesign.Constants.defaultiOSPlaceholderColor {
        didSet {
            placeholderLabel.textColor = placeholderColor
        }
    }
    
    override open var font: UIFont! {
        didSet {
            if placeholderFont == nil {
                placeholderLabel.font = font
            }
        }
    }
    
    open var placeholderFont: UIFont? {
        didSet {
            let font = (placeholderFont != nil) ? placeholderFont : self.font
            placeholderLabel.font = font
        }
    }
    
    override open var textAlignment: NSTextAlignment {
        didSet {
            placeholderLabel.textAlignment = textAlignment
        }
    }
    
    override open var text: String! {
        didSet {
            textDidChange()
        }
    }
    
    override open var attributedText: NSAttributedString! {
        didSet {
            textDidChange()
        }
    }
    
    override open var textContainerInset: UIEdgeInsets {
        didSet {
            updateConstraintsForPlaceholderLabel()
        }
    }
    
    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    public func commonInit() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(textDidChange),
                                               name: NSNotification.Name.UITextViewTextDidChange,
                                               object: nil)
        
        placeholderLabel.font = font
        placeholderLabel.textColor = placeholderColor
        placeholderLabel.textAlignment = textAlignment
        placeholderLabel.text = placeholder
        placeholderLabel.numberOfLines = 0
        placeholderLabel.backgroundColor = UIColor.clear
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(placeholderLabel)
        updateConstraintsForPlaceholderLabel()
    }
    
    public func updateConstraintsForPlaceholderLabel() {
        var newConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(\(textContainerInset.left + textContainer.lineFragmentPadding))-[placeholder]",
            options: [],
            metrics: nil,
            views: ["placeholder": placeholderLabel])
        newConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-(\(textContainerInset.top))-[placeholder]",
            options: [],
            metrics: nil,
            views: ["placeholder": placeholderLabel])
        newConstraints.append(NSLayoutConstraint(
            item: placeholderLabel,
            attribute: .width,
            relatedBy: .equal,
            toItem: self,
            attribute: .width,
            multiplier: 1.0,
            constant: -(textContainerInset.left + textContainerInset.right + textContainer.lineFragmentPadding * 2.0)
        ))
        removeConstraints(placeholderLabelConstraints)
        addConstraints(newConstraints)
        placeholderLabelConstraints = newConstraints
    }
    
    @objc public func textDidChange() {
        placeholderLabel.isHidden = !text.isEmpty
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        contentInset = UIEdgeInsets(top: topPadding, left: leftPadding, bottom: bottomPadding, right: rightPadding)
        placeholderLabel.preferredMaxLayoutWidth = textContainer.size.width - textContainer.lineFragmentPadding * 2.0
        
        layer.cornerRadius = cornerradius
        layer.borderColor = boderColor.cgColor
        layer.borderWidth = boderWidth
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerradius)
        layer.shadowPath = shadowPath.cgPath
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.UITextViewTextDidChange,
                                                  object: nil)
    }
    
}
