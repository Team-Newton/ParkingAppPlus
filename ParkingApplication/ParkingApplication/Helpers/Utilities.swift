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
    
}
