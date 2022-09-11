//
//  LanguageManager.swift
//  Telgani-Test
//
//  Created by Moustafa Gadallah on 15/02/1444 AH.
//

import UIKit


class LanguageManager {
    
    
    // MARK - Shared Instance
    
    static let manager: LanguageManager = {
        return LanguageManager()
    }()
    
    var isRTLLanguage: Bool {
        
        return UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft
    }

    
    
}
