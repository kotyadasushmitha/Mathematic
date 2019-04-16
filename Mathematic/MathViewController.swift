//
//  ViewController.swift
//  Mathematic
//
//  Created by Kotyada,Durga Susmitha on 4/15/19.
//  Copyright © 2019 Kotyada,Durga Susmitha. All rights reserved.
//

import UIKit

class MathViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    
    
    
    @IBOutlet weak var ActivityPicker: UIPickerView!
    
    
    @IBOutlet weak var weightTF: UITextField!
    
    @IBOutlet weak var exerciseTimeTf: UITextField!
    
    @IBOutlet weak var energyConsumedLBL: UILabel!
    
    @IBOutlet weak var timeToLoose: UILabel!
    
    func invalidinput(){
        let alert = UIAlertController(title: "Invalid", message: "you have not given correct input", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func calculateBTN(_ sender: Any) {
let value = pickerData[ActivityPicker.selectedRow(inComponent: 0)]
        var weight = 0.0
        if weightTF.text! != "" {
        let weightArray = weightTF.text!.components(separatedBy: " ")
        
        for i in weightArray{
            weight = weight + Double(i)!
        }
        }
            else {
                invalidinput()
            }

        if let time = Int(exerciseTimeTf.text!){

      let energy =   ExerciseCoach.energyConsumed(during: value, weight: weight, time: time)
     let timelost = ExerciseCoach.timeToLose1Pound(during: value, weight: weight)
        energyConsumedLBL.text = String(format: "%.1f cal", energy)
            timeToLoose.text = String(format: "%.1f minutes", timelost)

        }
        else
        {
            invalidinput()
        }
    }
    
    
    @IBAction func clearBTN(_ sender: Any) {
        ActivityPicker.selectRow(0, inComponent: 0, animated: true)
        weightTF.text! = ""
        exerciseTimeTf.text! = ""
        energyConsumedLBL.text! = "0 cal"
        timeToLoose.text! = "0 min"
    }
    var pickerData:[String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.ActivityPicker.delegate = self
        self.ActivityPicker.dataSource = self
        pickerData = ["Bicycling", "Jumping rope", "Running - slow", "Running - fast", "Tennis", "Swimming"]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

}

