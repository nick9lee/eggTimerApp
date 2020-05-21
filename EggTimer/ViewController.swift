//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    var player: AVAudioPlayer!
    let eggTimes = ["Soft": 180, "Medium": 240, "Hard": 420]
    var secondsPassed = 0
    var totalTime = 0
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        progressBar.progress = 0.0
        
        secondsPassed = 0
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        titleLabel.text = hardness
        
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed)/Float(totalTime)
            progressBar.progress = percentageProgress
        }
        else{
            timer.invalidate()
            titleLabel.text = "Done"
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
}
