//
//  UIColor+Extension.swift
//  WeaAreApp
//
//  Created by Dang Trung Hieu on 11/3/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

extension UIColor {
    
    class var background: UIColor {
           return UIColor(hex: "#FF6D26")
       }
       
       class var lightBackground: UIColor {
           return UIColor(hex: "#EFEFEF")
       }
       
       class var primary: UIColor {
           return UIColor(hex: "#006699")
       }
       
       class var titleText: UIColor {
           return UIColor(hex: "#1F1F1F")
       }
       
       class var bodyText: UIColor {
           return UIColor(hex: "#696969")
       }
       
       class var lightBodyText: UIColor {
           return UIColor(hex: "#787878")
       }
       
       class var lightSeparator: UIColor {
           return UIColor(hex: "#E9E9E9")
       }
       
       class var separator: UIColor {
           return UIColor(hex: "#D6D6D6")
       }

       class var ratingColor: UIColor {
           return UIColor(hex: "#E9D700")
       }
       
       class var accentColor: UIColor {
           return UIColor(hex: "#FF6639")
       }
       
       class var darkAccentColor: UIColor {
           return UIColor(hex: "#DA0707")
       }

       class var tabbarTitle: UIColor {
           return UIColor(hex: "#D4D0D0")
       }
       
       class var lightDisable: UIColor {
           return UIColor(hex: "#EAEAEA")
       }
       
       class var disable: UIColor {
           return UIColor(hex: "#D8D8D8")
       }

       class var tableBackground: UIColor {
           return UIColor(hex: "#F4F4F4")
       }
       
       class var buttonBackgroundActive: UIColor {
           return UIColor(hex: "#1975a3")
       }
       
       class var link: UIColor {
           return UIColor(hex: "#1da9fe")
       }
       
       class var darkBackgroundColor: UIColor {
           return UIColor(hex: "#888888")
       }
       
       class var placeholder: UIColor {
           return UIColor.lightBodyText.withAlphaComponent(0.5)
       }
       
       class var shimmerBGColor: UIColor {
           return UIColor.lightGray.withAlphaComponent(0.35)
       }
       
       class var scrollMenu: UIColor {
           return UIColor(hex: "#F5F5F5")
       }
       
       class var messageBackground: UIColor {
           return UIColor(hex: "EFF1F3")
       }
    
}

// MARK: - Support Method
extension UIColor {
    convenience init(hex: String) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            self.init(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.0)
            return
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: 1.0)
    }
}
