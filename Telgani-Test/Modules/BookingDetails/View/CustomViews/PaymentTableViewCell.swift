//
//  PaymentTableViewCell.swift
//  Telgani-Test
//
//  Created by Moustafa Gadallah on 14/02/1444 AH.
//

import UIKit

class PaymentTableViewCell: UITableViewCell {

     
    //MARK: - Outlets
    
    @IBOutlet weak var selectPaymentBtn: UIButton! {
        didSet{
            selectPaymentBtn.setTitle("", for: .normal)
            
        }
    }
  
    
    
    
    //MARK: - Variabels
    
    var selectPaymentAction: (() -> ())?
    var isSelectedPayment : Bool? = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
      
        // Initialization code
    }
    

    
    
    
    func showPayment(_ payment : Paymentmodel?) {
        
        selectPaymentBtn.isSelected = payment?.isSelected ?? false
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

   
        
    }
    
    //MARK: - Actions
    
    
    @IBAction func selectPaymentBtnAction(_ sender: Any) {
      
        selectPaymentAction?()
    }
    

}
