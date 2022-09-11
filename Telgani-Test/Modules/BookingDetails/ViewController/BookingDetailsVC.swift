//
//  BookingDetailsVC.swift
//  Telgani-Test
//
//  Created by Moustafa Gadallah on 14/02/1444 AH.
//

import UIKit

class BookingDetailsVC : UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
    
    @IBOutlet weak var paymentsTableView: UITableView! {
        didSet {
            paymentsTableView.delegate = self
            paymentsTableView.dataSource = self
        }
    }
    
    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var paymentsView: UIView!
    @IBOutlet weak var paymentDetailsView: UIView!
    @IBOutlet weak var bookingActionsView: UIView!
    
    
    //MARK: - Variabels
    
    lazy var viewModel = BookingDetailsViewModel()
    
    
    //MARK: - View Life Cycle
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupViewModel()
        
    }
    
    
    
    
    //MARK: - Setup ViewModel
    
    func setupViewModel() {
        
        viewModel.reloadTableData = { [weak self] in
            
            self?.paymentsTableView.reloadData()
            
        }
        
    }
    
    
    
    //MARK: - Helper Methods
    
    func setupView() {
        
        self.removeInputView(view: bookingActionsView)
    
        title = "Reservation Details"
        setupBackBarButtonItem()
        
        
    }
    
    
    
    func setupBackBarButtonItem() {
        
        if self.navigationController?.viewControllers.first == self {

            navigationItem.leftBarButtonItem = nil

        } else {
            

            let img = UIImage(named: "Back")
            let btnLeft =  UIBarButtonItem(image: img,style: .plain,target: self,action: #selector(backAction))
                                          
            btnLeft.tintColor = .white
            
            navigationItem.leftBarButtonItem = btnLeft
        }
        
    }
    
    // MARK: - Actions

    @objc func backAction() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    //MARK: - Initialization
    
    class func initializeFromStoryboard() -> BookingDetailsVC {
        
        let storyboard = UIStoryboard(name: Storyboards.BookingDetails, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: BookingDetailsVC.self)) as! BookingDetailsVC
    }
    
    
    //MARK: - Actions
    
    
    @IBAction func bookingOperationsBtnAction(_ sender: Any) {
        
        
        self.addInputView(view: bookingActionsView, atIndex: 1)
        
        
        
    }
    
    @IBAction func hideDetailsBtnAction(_ sender: Any) {
        
        
    }
    
    
    //MARK: - Helper Methods
    
    func removeInputView(view: UIView) {
        
        containerStackView.removeArrangedSubview(view)
        view.isHidden = true
    }
    
    func addInputView(view: UIView, atIndex index: Int? = nil) {
        
        if let index = index {
            containerStackView.insertArrangedSubview(view, at: index)
        } else {
            containerStackView.addArrangedSubview(view)
        }
        view.isHidden = false
    }
    
    
}






//MARK: - UIScroll View Delegate

extension BookingDetailsVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
            scrollView.contentOffset.x = 0
        }
    }
    
}

//MARK: - UITableView Delegate

extension BookingDetailsVC : UITableViewDelegate  { }


//MARK: - UITableView DataSource

extension BookingDetailsVC : UITableViewDataSource  {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberofPayments() ?? 0
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PaymentTableViewCell.self), for: indexPath) as! PaymentTableViewCell
        
        let payment = viewModel.payment(atIndex: indexPath.row)
        cell.showPayment(payment)
        cell.selectPaymentAction = {  [weak self] in
            
            self?.viewModel.selectpayment(payment)
            
            
        }
        
        return cell
        
    }
    
    
}


