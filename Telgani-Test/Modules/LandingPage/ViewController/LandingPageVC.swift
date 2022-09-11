//
//  LandingPageVC.swift
//  Telgani-Test
//
//  Created by Moustafa Gadallah on 15/02/1444 AH.
//

import UIKit

class LandingPageVC: UITabBarController {

    
    // MARK - Constants

    let indicatorHeight: CGFloat = 11.0

    
    //MARK: - Variables
    
    override var selectedViewController: UIViewController? {
        didSet {
            viewModel.updateItemsAttributes(forViewControllers: viewControllers,
                                            selectedViewController: selectedViewController)
            moveIndicatorViewToItem(item: selectedViewController?.tabBarItem, animated: true)
        }
    }
    
    lazy var viewModel = LandingPageViewModel()
    lazy var indicatorView = UIImageView(image: UIImage(named: "Bar Green Indicator"))

    
    //MARK: - Initialization
    
    class func initializeFromStoryboard() -> LandingPageVC {
        
        let storyboard = UIStoryboard(name: Storyboards.LandingPage, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: LandingPageVC.self)) as! LandingPageVC
    }
    
    class func initializeWithNavigationController() -> UINavigationController {
        
        return UINavigationController(rootViewController: LandingPageVC.initializeFromStoryboard())
    }
    
    
    //MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        moveIndicatorViewToItem(item: selectedViewController?.tabBarItem, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
        setupIndicatorView()
    }
    
    
    //MARK: - Setup
    
    func setupTabBar() {
        
        delegate = self
        tabBar.unselectedItemTintColor = .darkGray
        tabBar.barTintColor = .darkGray
        viewControllers = viewModel.tabBarViewControllers()
        selectedViewController = viewModel.initialSelectedViewController()
    }
    
    func setupIndicatorView() {
        
        indicatorView.frame.origin.y = tabBar.frame.origin.y
        view.addSubview(indicatorView)
    }

    
    //MARK: - TabBar Indicator View

    func moveIndicatorViewToItem(item: UITabBarItem?, animated: Bool) {
        
        guard let tabBarItems = tabBar.items,
              let item = item,
              var itemIndex: Int = tabBarItems.firstIndex(of: item)
        else { return }
        
        if LanguageManager.manager.isRTLLanguage {
            itemIndex = (tabBarItems.count - 1) - itemIndex
        }
        
        let itemWidth = tabBar.bounds.width / CGFloat(tabBarItems.count)

        let indicatorFrame = CGRect(x: CGFloat(itemIndex) * itemWidth,
                                    y: tabBar.frame.origin.y - indicatorHeight,
                                    width: itemWidth,
                                    height: indicatorHeight)
        
        
        UIView.animate(withDuration: animated ? 0.2 : 0) { [weak self] in
            
            guard let self = self else { return }
            
            self.indicatorView.frame = indicatorFrame
        }
    }
}


//MARK: - UITabBarControllerDelegate

extension LandingPageVC: UITabBarControllerDelegate {

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {

        moveIndicatorViewToItem(item: item, animated: true)
    }
}
