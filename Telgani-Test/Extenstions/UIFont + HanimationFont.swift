//
//  UIFont + HanimationFont.swift
//  Telgani-Test
//
//  Created by Moustafa Gadallah on 14/02/1444 AH.
//

import UIKit


extension UIFont {
    
    public static func hanimationFont(fontSize: CGFloat) -> UIFont? {
        
        return UIFont(name: Fonts.HanimationRegular, size: fontSize)
    }
    
}
