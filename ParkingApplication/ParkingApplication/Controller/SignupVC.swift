//
//  SignupViewController.swift
//  ParkingApplication
//
//  Created by 王凡星 on 2019/11/14.
//  Copyright © 2019 SheridanCollege. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class SignupVC: UIViewController {

    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtPhoneNum: UITextField!
    @IBOutlet var txtCarPlateNum: UITextField!
    @IBOutlet var btn_signup: UIButton!
    
    override func viewDidLoad() {
        view.addVerticalGradientLayer(leftColor: UIColor(hexString: "#FFFEFF")!, rightColor: UIColor(hexString: "#D7FFFE")!)
        super.viewDidLoad()
        self.setupBarButton()
        self.setupElement()

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
    
    
    @IBAction func onSignupClick(_ sender: UIButton) {
        //validate
        let error = validateFields()
        if error != nil{
            showError(error: error!)
        }
        else{
            let name = txtName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let phoneNum = txtPhoneNum.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let carPlateNum = txtCarPlateNum.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().createUser(withEmail: email, password: password){
                (result,error) in
                if (error != nil){
                    //print(error?.localizedDescription ?? 0)
                    self.showError(error: "Your account already exists, please sign in")
                }else{
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["name":name,"phoneNum":phoneNum,"carPlateNum":carPlateNum,"uid":result!.user.uid]) {
                        (error) in
                        if error != nil {
                            self.showError(error: "Error saving information")
                        }
                        
                    }
                    
                    
                    
                }
            }
        }
    }
    
    
    //Check the fields and validate the data. If everything is correct, this method returns nil, otherwise return error message.
    func validateFields()->String?{
        //Check if all fields are filled in
        if txtName.text?.trimmingCharacters(in: .whitespacesAndNewlines)==""||txtEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines)==""||txtPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)==""||txtCarPlateNum.text?.trimmingCharacters(in: .whitespacesAndNewlines)==""
        {
            return "Please fill in all fields"
        }
        
        //Check if password is secure
        let cleanedPassword = txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword)==false{
            return "Your password should at least 8 characters, contains an uppercase letter, a lowercase letter and a number"
        }
        
        let cleanedEmail = txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isEmailValid(cleanedEmail)==false{
            return "Your Email is invalid"
        }
        
        let cleanedPhone = txtPhoneNum.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPhoneValid(cleanedPhone)==false{
            return "Your Phone Number is invalid"
        }
        return nil
    }
    
    func showError(error:String){
        let alertController = UIAlertController(title: "Fail to Sign Up", message:
            error, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
}









