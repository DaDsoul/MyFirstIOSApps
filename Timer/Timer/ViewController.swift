//
//  ViewController.swift
//  Timer
//
//  Created by talgat on 13.06.17.
//  Copyright © 2017 Akezhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var laps: [String] = []
    var timer = Timer()
    var minutes: Int = 0
    var seconds: Int = 0
    var fractions: Int = 0
    var startstopWatch : Bool = true
    var addLap: Bool = false
    var stopwatchString: String = ""
    
    
    @IBOutlet weak var lapresetButton: UIButton!

 
    @IBOutlet weak var lapsTableView: UITableView!
    @IBAction func startStop(_ sender: UIButton) {
        if startstopWatch == true{
            timer = Timer.scheduledTimer(timeInterval: 0.01 , target: self, selector: #selector(updateStopwatch), userInfo: nil, repeats: true)
        startstopWatch = false
            
            startstopButton.setTitle("Stop", for: .normal)
            lapresetButton.setTitle("Lap", for: .normal)
            
            addLap = true
        }
        else {
            timer.invalidate()
            
             startstopWatch = true
            
            startstopButton.setTitle("Start", for: .normal)
            lapresetButton.setTitle("Reset", for: .normal)
            
            addLap = false
        }
    }


    @IBAction func lapReset(_ sender: UIButton) {
        if addLap == true {
            laps.insert(stopwatchString, at: 0)
            lapsTableView.reloadData()
        } else {
        addLap = false
            lapresetButton.setTitle("lap", for: .normal)
            laps.removeAll()
            lapsTableView.reloadData() 
            fractions = 0
            seconds = 0
            minutes = 0
            stopwatchString = "00:00.00"
            stopWatchLabel.text = stopwatchString
            
        }
    }
    @IBOutlet weak var startstopButton: UIButton!
    @IBOutlet weak var stopWatchLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        stopWatchLabel.text = "00:00.00"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
var cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier:  "Cell")
        cell.textLabel?.text = "Lap \(laps.count - indexPath.row)"
        cell.detailTextLabel?.text = laps[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return laps.count
    }
    func updateStopwatch(){
        fractions+=1
        if fractions == 100 {
        seconds += 1
            fractions = 0
        }
        if seconds == 60 {
        minutes += 1
            seconds = 0
        }
        let fractionString = fractions > 9 ? "\(fractions)" : "0\(fractions)"
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesString = minutes > 9 ? "\(minutes)":"0\(minutes)"
        stopwatchString = "\(minutesString):\(secondsString).\(fractionString)"
    stopWatchLabel.text = stopwatchString
        
    }
    

}

