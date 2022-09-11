//
//  UINavigationController + Style.swift
//  Telgani-Test
//
//  Created by Moustafa Gadallah on 14/02/1444 AH.
//

import UIKit

@IBDesignable extension UINavigationController {
    @IBInspectable var barTintColor: UIColor? {
        set {
            navigationBar.barTintColor = newValue
        }
        get {
            guard  let color = navigationBar.barTintColor else { return nil }
            return color
        }
    }

    @IBInspectable var tintColor: UIColor? {
        set {
            navigationBar.tintColor = newValue
        }
        get {
            guard  let color = navigationBar.tintColor else { return nil }
            return color
        }
    }

    @IBInspectable var titleColor: UIColor? {
        set {
            guard let color = newValue else { return }
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
        }
        get {
            return navigationBar.titleTextAttributes?[NSAttributedString.Key(rawValue: "NSForegroundColorAttributeName")] as? UIColor
        }
    }
}
