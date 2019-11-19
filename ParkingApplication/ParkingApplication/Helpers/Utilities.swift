//
//  Utilities.swift
//  ParkingApplication
//
//  Created by 王凡星 on 2019/11/18.
//  Copyright © 2019 SheridanCollege. All rights reserved.
//

import Foundation
import UIKit

class Utilities{
    static func styleTextField(_ textfield:UITextField){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height-2, width: textfield.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        
        textfield.borderStyle = .none
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func isPasswordValid(_ password:String)->Bool{
         let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
           return passwordTest.evaluate(with: password)
    }
    
    
    static func isEmailValid(_ email:String)->Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: email)
        return result
    }
    
    static func isPhoneValid(_ phone: String) -> Bool {
        let phoneRegex = "(\\([0-9]{3}\\) |[0-9]{3})[0-9]{3}[0-9]{4}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        let result =  phoneTest.evaluate(with: phone)
        return result
    }
    
    
   
}
