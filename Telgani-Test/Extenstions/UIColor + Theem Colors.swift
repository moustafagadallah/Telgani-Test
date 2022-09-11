//
//  UIColor + Theem Colors.swift
//  Telgani-Test
//
//  Created by Moustafa Gadallah on 13/02/1444 AH.
//

import UIKit

extension UIColor {
    
    public convenience init(hex: UInt32) {
        let value = hex & 0xffffff
        let red = (CGFloat)((value >> 16) & 0xff)/255.0
        let green = (CGFloat)((value >> 8) & 0xff)/255.0
        let blue = (CGFloat)(value & 0xff)/255.0
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
    
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}


extension UIColor {
    
    public static var telganiPrimaryColor: UIColor {
      
        return UIColor(hexString: "#3AA5B9")
    }
    
    public static var telganiWhiteColor: UIColor {
        
        return UIColor.white
    }
    
    
  
    
    public static var telganiLabelTextColor: UIColor {
        
        return UIColor(hexString: "#4E5D78")
    }
    
    
    
  
  
}
