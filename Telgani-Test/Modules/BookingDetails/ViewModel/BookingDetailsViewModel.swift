//
//  BookingDetailsViewModel.swift
//  Telgani-Test
//
//  Created by Moustafa Gadallah on 15/02/1444 AH.
//

import UIKit

class BookingDetailsViewModel {
   
    //MARK: - Variabels
    
    var reloadTableData: (() -> ())?
    var payments  = [Paymentmodel(),Paymentmodel(),Paymentmodel(), Paymentmodel(), Paymentmodel() ]
    
    
  
    
    //MARK: - Helper Methods

    
    func payment(atIndex index: Int) -> Paymentmodel? {
        
        return payments[index]
    }
    
    func selectpayment(_ payment: Paymentmodel?) {
    
        setPaymentSelected(!(payment?.isSelected ?? false), forPayment: payment)
    }
    
    func setPaymentSelected(_ select: Bool, forPayment payment: Paymentmodel?) {
        
        payment?.isSelected = select
        reloadTableData?()
    }
    
    func numberofPayments()  -> Int? {
        
        payments.count 
    }
    
}
