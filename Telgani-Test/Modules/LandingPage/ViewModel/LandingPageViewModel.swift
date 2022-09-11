//
//  LandingPageViewModel.swift
//  Telgani-Test
//
//  Created by Moustafa Gadallah on 15/02/1444 AH.
//

import UIKit

class LandingPageViewModel {

    
    // MARK - Constants
    
    let itemFontSize: CGFloat = 11.0

    
    // MARK - Variables
    
    lazy var myAccountVC = UIViewController()
    
    lazy var myBookingsVC = UIViewController()
    lazy var homeVC = HomeVC.initializeWithNavigationController()
    lazy var moreVC = UIViewController()
    
    
    // MARK-: Setup

    func setupViewControllersItems() {

        myAccountVC.tabBarItem = tabBarItem(withItemName: "Profile", imageName: "My_Account_Item")
        myBookingsVC.tabBarItem = tabBarItem(withItemName: "Bookings", imageName: "My_Bookings_Item")
        homeVC.tabBarItem = tabBarItem(withItemName: "Discover", imageName: "DiscoverItem")
        moreVC.tabBarItem = tabBarItem(withItemName: "More", imageName: "More_Item")
    }
    
    func tabBarViewControllers() -> [UIViewController] {
        
        setupViewControllersItems()
        
        return [
            homeVC,
            myBookingsVC,
            myAccountVC,
            moreVC,
        ]
    }

    func initialSelectedViewController() -> UIViewController? {
        
        return homeVC
    }
    
    func tabBarItem(withItemName itemName: String, imageName: String) -> UITabBarItem {
        
        let tabBarItem = UITabBarItem()
        tabBarItem.title = itemName
        tabBarItem.image = UIImage(named: imageName)
        tabBarItem.setTitleTextAttributes(normalItemAttributes(), for: .normal)

        return tabBarItem
    }
    
    func normalItemAttributes() -> [NSAttributedString.Key : Any] {
        
        return [
            
            NSAttributedString.Key.foregroundColor : UIColor.darkGray
        ]
    }
    
    func selectedItemAttributes() -> [NSAttributedString.Key : Any] {
        
        return [
          
            NSAttributedString.Key.foregroundColor : UIColor.telganiPrimaryColor
        ]
    }
    
    func updateItemsAttributes(forViewControllers viewControllers: [UIViewController]?, selectedViewController: UIViewController?) {
        
        guard let viewControllers = viewControllers else { return }
        
        for viewController in viewControllers {

            let isSelectedVC = (viewController == selectedViewController)
            let attributes = isSelectedVC ? selectedItemAttributes() : normalItemAttributes()
            
            viewController.tabBarItem.setTitleTextAttributes(attributes, for: .normal)
        }
    }
}

