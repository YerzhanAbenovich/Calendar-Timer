//
//  ViewController.swift
//  Calendar-Timer
//
//  Created by Yerzhan Parimbay on 27.10.2026.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var finishDatePicker: UIDatePicker!
    
    var start: Date = Date()
    var finish: Date = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondVC" {
            if let vc = segue.destination as? TimerViewController {
                start = startDatePicker.date
                finish = finishDatePicker.date
                
                //Передача даты в значения на странице TimerViewController
                vc.startDate = start
                vc.finishDate = finish
                
                vc.timerDate = start
            }
        }
    }


}

