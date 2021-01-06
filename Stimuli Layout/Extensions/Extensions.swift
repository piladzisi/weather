//
//  Extensions.swift
//  Stimuli Layout
//
//  Created by Anna Sibirtseva on 30/01/2020.
//  Copyright © 2020 Anna Sibirtseva. All rights reserved.
//

import UIKit

public extension UIView {
  func addSubviews(_ views: UIView...) {
    for view in views {
      addSubview(view)
    }
  }
}


struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}

extension UIView {
    
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach{ $0?.isActive = true }
        
        return anchoredConstraints
    }
    
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    
}


extension UIButton {
    func roundCorners() {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}

extension UILabel {
    func setBottomBorder() {
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
       // self.layer.shadowColor = UIColor.grayscaleLightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}


extension UIScreen{

    

    // TODO: this & UIDevice.current.model do really only need to be determined once.

    //  Static properties can be type-bound and added via extensions.

    //  Got to consider how to move this to instance level & make it a once-off computation.

//    static let ppi: Double = {
//
//        switch UIDevice.current.model {
//
//        case .iPodTouch5, .iPodTouch6:                  return 326
//
//        case .iPhone4, .iPhone4s:                       return 326
//
//        case .iPhone5, .iPhone5s, .iPhone5c:            return 326
//
//        case .iPhone6:                                  return 326
//
//        case .iPhone6Plus:                              return 401
//
//        case .iPhone6s:                                 return 326
//
//        case .iPhone6sPlus:                             return 401
//
//        case .iPhone7:                                  return 326
//
//        case .iPhone7Plus:                              return 401
//
//        case .iPhoneSE:                                 return 326
//
//        case .iPhone8:                                  return 326
//
//        case .iPhone8Plus:                              return 401
//
//        case .iPhoneX:                                  return 441
//
//        case .iPhoneXs:                                 return 458
//
//        case .iPhoneXsMax:                              return 458
//
//        case .iPhoneXR:                                 return 458
//
//        case .iPad2:                                    return 132
//
//        case .iPad3, .iPad4, .iPad5, .iPad6:            return 264
//
//        case .iPadAir, .iPadAir2, .iPadAir3:            return 264
//
//        case .iPadMini, .iPadMini2, .iPadMini3,.iPadMini4, .iPadMini5:
//
//                                                        return 326
//
//        case .iPadPro_97in:                             return 264
//
//        case .iPadPro_129in, .iPadPro_129in2, .iPadPro_129in3:
//
//                                                        return 264
//
//        case .iPadPro_105in:                            return 264
//
//        case .iPadPro_11in:                             return 264
//
//        case .iOSSimulator:                             return 458
//
//        case .unknown:                                  return 264
//
//        }
//
//    }()
//
    

    static func inchesToPt(inch: Double) -> CGFloat {

        return CGFloat(inch * self.ppi) / self.main.nativeScale

    }

    

}
