//
//  PrimaryButton.swift
//  Telgani-Test
//
//  Created by Moustafa Gadallah on 13/02/1444 AH.
//

import UIKit

@IBDesignable
class PrimaryButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        self.setupView()
    }
    
    func setupView() {
        
        backgroundColor = .telganiPrimaryColor
        setTitleColor(.telganiWhiteColor, for: .normal)
        self.titleLabel?.font =  UIFont.hanimationFont(fontSize: 16)

    }
}
