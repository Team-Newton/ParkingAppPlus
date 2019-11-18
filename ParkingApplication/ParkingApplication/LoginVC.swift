//
//  LoginVC.swift
//  ParkingApplication
//
//  Created by 王凡星 on 2019/11/14.
//  Copyright © 2019 SheridanCollege. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignUpClick(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let signUpNavigationVC = storyBoard.instantiateViewController(withIdentifier: "SignUpNavigationScene") as? SignUpNavigationVC else { return }
        present(signUpNavigationVC, animated: true, completion: nil)
    }
    
    
    @IBAction func onSignInClick(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        guard let signInNavigationVC = storyBoard.instantiateViewController(withIdentifier: "SignInNavigationScene") as? SignInNavigationVC else { return }
//        self.present(signInNavigationVC, animated: true, completion: nil)
        
        guard let signInVC = storyBoard.instantiateViewController(withIdentifier: "SignInScene") as? SignInVC else {return}
        self.present(signInVC,animated: true,completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
