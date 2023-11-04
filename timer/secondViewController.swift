//
//  secondViewController.swift
//  timer
//
//  Created by Tenizbayev Bolat on 30.10.2023.
//

import UIKit

class secondViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    var time = 0

    var timer = Timer()
    
    var startTime = 0
    
    var isTimerRunning = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        label.text = timeToString(IntTime: time)
        
        startTime = time
    }
    
    @objc func countTime(){
        time = time - 1
        
        label.text = timeToString(IntTime: time)
        
        if time == 0 {
            timer.invalidate()
            isTimerRunning = true
        }
    }
    
    @IBAction func startTimer(_ sender: Any) {
        if isTimerRunning == true{
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
        
        isTimerRunning = true
    }
    
    @IBAction func pauseTimer(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
    }
    
    @IBAction func restartTimer(_ sender: Any) {
        timer.invalidate()
        
        time = startTime
        
        isTimerRunning = false
        
        label.text = timeToString(IntTime: time)
    }
    
    func timeToString(IntTime: Int) -> String{
        let second = IntTime % 60
        
        let minute = (IntTime / 60) % 60
        
        let hour = IntTime / 3600
        
        return String(format: "%0.2d:%0.2d:%0.2d", hour, minute, second)
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
