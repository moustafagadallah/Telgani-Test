//
//  VechileCollectionViewCell.swift
//  Telgani-Test
//
//  Created by Moustafa Gadallah on 14/02/1444 AH.
//

import UIKit

class VechileCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var freeDeliveryLabel: UILabel!
    @IBOutlet weak var unlimitedKmLabel: UILabel!
    
    @IBOutlet weak var firstInsuranceFeatureLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       setupLabelAttributedStrings()
    }
    
    
    //MARK: - Helper Methods
    
    func setupLabelAttributedStrings() {
        
        
        let textColor = UIColor.telganiPrimaryColor
        let secondarColor = UIColor.telganiLabelTextColor
        
        let freeTextAttributes = [
                                       NSAttributedString.Key.foregroundColor : textColor]
        
        let descriptionAttributes = [
                                       NSAttributedString.Key.foregroundColor : secondarColor]
        
        let freeAttibuted = NSMutableAttributedString(string: "Free   \n ",
                                                        attributes: freeTextAttributes)
        
        freeAttibuted.append(NSAttributedString(string:"Delivery",
                                                  attributes:descriptionAttributes))
        freeDeliveryLabel.attributedText = freeAttibuted
      
        let fullAttibuted = NSMutableAttributedString(string: "Full  \n ",
                                                      attributes: freeTextAttributes)
        
        fullAttibuted.append(NSAttributedString(string:"Insurance Available",
                                                  attributes:descriptionAttributes))
        
        firstInsuranceFeatureLabel.attributedText = fullAttibuted
        
        let freekmtext = NSMutableAttributedString(string: "1500 KM    \n ",
                                                   attributes: descriptionAttributes)
        
        freekmtext.append(NSAttributedString(string:"Free  ",
                                                        attributes:freeTextAttributes))
        freekmtext.append(NSAttributedString(string:"Per Month ",
                                             attributes:descriptionAttributes))
        
        unlimitedKmLabel.attributedText  = freekmtext
        
    }
}
