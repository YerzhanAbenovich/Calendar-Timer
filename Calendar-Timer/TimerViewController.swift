//
//  TimerViewController.swift
//  Calendar-Timer
//
//  Created by Yerzhan Parimbay on 27.10.2026.
//

import UIKit

class TimerViewController: UIViewController {
    @IBOutlet weak var starDateLabel: UILabel!
    @IBOutlet weak var finishDateLabel: UILabel!
    
    @IBOutlet weak var timerDateLabel: UILabel!
    
    var startDate: Date = Date()
    var finishDate: Date = Date()
    var timerDate: Date = Date()
    
    var timer = Timer()
    var timerStart = true
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        starDateLabel.text = startDate.formatted(date: .complete, time: .standard)
        finishDateLabel.text = finishDate.formatted(date: .complete, time: .standard)
        timerDateLabel.text = timerDate.formatted(date: .complete, time: .standard)
    }
    
    @objc func fromStarttoFinish() {
        if  finishDate >= timerDate {
            //addingTimeInterval(3600) - мы прибавляем 1 секуду и даем новое значение timerDate
            timerDate = timerDate.addingTimeInterval(1)
            timerDateLabel.text = timerDate.formatted(date: .complete, time: .standard)
        } else {
            timerDateLabel.text = finishDate.formatted(date: .complete, time: .standard)
            timer.invalidate()
        }
    }
    
    @IBAction func play(_ sender: Any) {
        // Задача, чтобы кнопка play не срабатывало несколько раз, для этого и переменная timerStart
        if timerStart {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fromStarttoFinish), userInfo: nil, repeats: true)
            timerStart = false
        }
        
    }
    
    @IBAction func restart(_ sender: Any) {
        timer.invalidate()
        timerDateLabel.text = startDate.formatted(date: .complete, time: .standard)
        // Нам не только нужно в лейбл передать значение старта, но и данные даты, чтобы при нажати play таймер просто не продолжился
        timerDate = startDate
        timerStart = true
        
    }
    
    @IBAction func stop(_ sender: Any) {
        timer.invalidate()
        timerStart = true
    }
}
