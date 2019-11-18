//
//  SignupViewController.swift
//  ParkingApplication
//
//  Created by 王凡星 on 2019/11/14.
//  Copyright © 2019 SheridanCollege. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {

    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtPhoneNum: UITextField!
    @IBOutlet var txtCarPlateNum: UITextField!
    
    @IBOutlet var btn_signup: UIButton!
    
    override func viewDidLoad() {
        view.addVerticalGradientLayer(leftColor: UIColor(hexString: "#FFFEFF")!, rightColor: UIColor(hexString: "#D7FFFE")!)
        //btn_signup.layer.cornerRadius = 2.0
        super.viewDidLoad()
        self.setupBarButton()
        
        setupElement()

    }
    func setupElement(){
        Utilities.styleTextField(txtName)
        Utilities.styleTextField(txtEmail)
        Utilities.styleTextField(txtPassword)
        Utilities.styleTextField(txtPhoneNum)
        Utilities.styleTextField(txtCarPlateNum)
    }
    

    func setupBarButton(){
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "back.png"), for: .normal)
        backButton.setTitle("  Back", for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
    }
    @objc func backButtonPressed() {
            dismiss(animated: true, completion: nil)
           
        }
    
    }









