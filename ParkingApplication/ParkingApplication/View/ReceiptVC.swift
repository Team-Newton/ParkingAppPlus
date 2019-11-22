//
//  ReceiptVC.swift
//  ParkingApplication
//
//  Created by CHEN TONG on 2019-11-19.
//  Copyright © 2019 SheridanCollege. All rights reserved.
//

import UIKit
import Firebase

class ReceiptVC: UIViewController {
    
    var documentID: String! = ""
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getReceipt()
        // Do any additional setup after loading the view.
    }
    
    func getReceipt(){
         db.collection("tickets").getDocuments() { (querySnapshot, err) in
             if let err = err {
                 print("Error getting documents: \(err)")
             } else {
                 for document in querySnapshot!.documents {
                    if (document.documentID == self.documentID){
                        print("\(document.documentID) => \(document.data())")
                 }
             }
            }
        }
    }
    

}
