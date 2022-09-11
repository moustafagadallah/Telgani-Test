//
//  PrimaryNavigationController.swift
//  Telgani-Test
//
//  Created by Moustafa Gadallah on 14/02/1444 AH.
//

import Foundation
import UIKit

class PrimaryNavigationController: UINavigationController {

    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
    }
    
    
    func setupNavigation() {
        
        navigationController?.navigationBar.backgroundColor = .telganiPrimaryColor
        navigationController?.navigationBar.barTintColor = .telganiPrimaryColor
        navigationController?.navigationBar.prefersLargeTitles = true
        if var textAttributes = navigationController?.navigationBar.titleTextAttributes {
            textAttributes[NSAttributedString.Key.foregroundColor] = UIColor.white
            navigationController?.navigationBar.titleTextAttributes = textAttributes
        }
        
        
    }
}
