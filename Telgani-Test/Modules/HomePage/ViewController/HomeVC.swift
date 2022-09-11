//
//  HomeVC.swift
//  Telgani-Test
//
//  Created by Moustafa Gadallah on 14/02/1444 AH.
//

import UIKit

class HomeVC : UIViewController {
    
    
    // MARK: - Outlets
    
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            
        }
    }
    
    // MARK: - Vairiabels
    
    lazy var viewModel = HomeViewModel()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    
 
    // MARK: - setup
    
    func setupView() {
        
        title = "Discover"
        navigationController?.navigationBar.backgroundColor = .telganiPrimaryColor
        navigationController?.navigationBar.barTintColor = .telganiPrimaryColor
        navigationController?.navigationBar.prefersLargeTitles = true
        if var textAttributes = navigationController?.navigationBar.titleTextAttributes {
            textAttributes[NSAttributedString.Key.foregroundColor] = UIColor.white
            navigationController?.navigationBar.titleTextAttributes = textAttributes
        }
       
      
    }

    
    
    
    // MARK: - Actions

    @objc func backAction() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - Initialization
    
    class func initializeFromStoryboard() -> HomeVC {
        
        let storyboard = UIStoryboard(name: Storyboards.Home, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: HomeVC.self)) as! HomeVC
    }
    
    class func initializeWithNavigationController() -> UINavigationController {
        
        return PrimaryNavigationController(rootViewController: HomeVC.initializeFromStoryboard())
    }
    
    
    
}

// MARK: - UITableView Delegate

extension HomeVC : UITableViewDelegate {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberofPartners() ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PartenerTableViewCell.self), for: indexPath) as! PartenerTableViewCell
           
        cell.navigatetoBookingDetails = { [weak self] in
            
            let bookingDetailsVC = BookingDetailsVC.initializeFromStoryboard()
            self?.navigationController?.pushViewController(bookingDetailsVC, animated: true)
            
        }
        
        
        return cell
        
    }
    

    
}


// MARK: - UITableView DatsSource

extension HomeVC : UITableViewDataSource { }
