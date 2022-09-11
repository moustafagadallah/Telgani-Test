//
//  PartenerCellViewModel.swift
//  Telgani-Test
//
//  Created by Moustafa Gadallah on 14/02/1444 AH.
//

import UIKit

class PartenerCellViewModel {
   
    var pushViewController: ((_ vc: UIViewController) -> ())?

    var numberofCars : Int? = 20
   
    
    func navigateToBookingDetails() {
        
        
        let bookingDetailsVC = BookingDetailsVC.initializeFromStoryboard()
        
        /// Data Injection If Any Like (Booking Id)
        
        self.pushViewController?(bookingDetailsVC)
    
        
    }
    
    
    
}
