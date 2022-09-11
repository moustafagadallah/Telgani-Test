//
//  UINavigationController + Pop.swift
//  Telgani-Test
//
//  Created by Moustafa Gadallah on 14/02/1444 AH.
//

import UIKit

extension UINavigationController {
    
    func backToViewController(viewController: Swift.AnyClass) {
        for element in viewControllers as Array {
            if element.isKind(of: viewController) {
                self.popToViewController(element, animated: true)
                break
            }
        }
    }
}
