//
//  addParkingVC.swift
//  ParkingApplication
//
//  Created by CHEN TONG on 2019-11-19.
//  Copyright © 2019 SheridanCollege. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore


class addParkingVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var txtPlate: UITextField!
    @IBOutlet var lblCode: UILabel!
    @IBOutlet var lblSuit: UILabel!
    @IBOutlet var timePicker: UIPickerView!
    var ref:DatabaseReference!
    var key:String?
    
    var timeData : [String] = [String]()
    var timeAmount : [Int] = [Int]()
    var selectedTime : String! = "Unknown"
    var billAmount : Int! = 0
    var documentID : String! = "Unknown"
    
    let date = Date()
    let timeFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.populatePickers()
        selectedTime = timeData[0]
        billAmount = timeAmount[0]
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSubmitClick(_ sender: UIButton){
        print("It works !")
        let plate = txtPlate.text ?? "unknown"
        let code = lblCode.text!
        let suit = lblSuit.text!
        let cost = "$" + String(billAmount)
        timeFormatter.dateFormat = "yyy-MM-dd:HH:mm:ss"
        let strNowTime = timeFormatter.string(from: date) as String
        let msg = "Are you sure to purchase parking ticket for " + plate + " at " + code + " for " + selectedTime + " from " + strNowTime + " ?"
        
        let alertMessage = UIAlertController(title: "Confirm your order", message: msg, preferredStyle: .alert)
        
        alertMessage.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alertMessage.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {_ in self.saveTicket(plate: plate, code: code, suit: suit, cost: cost, strNowTime: strNowTime)}))
//        alertMessage.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {_ in self.openReceiptScene()}))
        
        self.present(alertMessage, animated: true, completion: nil)
    }
    
    func saveTicket(plate:String,code:String,suit:String,cost:String,strNowTime:String){
        var ref: DocumentReference? = nil
        ref = db.collection("tickets").addDocument(data: [
            "plateNo": plate,
            "buildingCode": code,
            "suitNo": suit,
            "period": selectedTime!,
            "fee": cost,
            "Time": strNowTime
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                self.documentID = String(ref!.documentID)
                print("Document added with ID: \(ref!.documentID)")
                self.openReceiptScene()
            }
        }
    }
    
    
    func populatePickers(){
        //initialize array data
        timeData = ["1-hour or less", "3-hour", "10-hour", "24-hour"]
        timeAmount = [4,8,12,20]
        //connect data
        self.timePicker.delegate = self
        self.timePicker.dataSource = self
    }
    
    //number of columns in Pickerview
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //number of rows in Pickerview
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.timeData.count
    }

    //assign data from array to picker
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.timeData[row]
    }
    
    //fetch selected item from coffee picker
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedTime = self.timeData[row]
        self.billAmount = self.timeAmount[row]
    }
    
    func openReceiptScene(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let receiptVC = storyBoard.instantiateViewController(withIdentifier: "ReceiptScene") as? ReceiptVC else { return }
        receiptVC.documentID = self.documentID
        present(receiptVC, animated: true, completion: nil)
    }
}
