//
//  ViewController.swift
//  EggTimer
//
//  Created by Rudolf Amirian 08.10.2023
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var countdawnLabel: UILabel!
    var audioPlayer: AVAudioPlayer?

    var timer = Timer()
    let eggTime = ["Soft": 300, "Medium": 420, "Hard": 720]
    var totalTime = 0
    var secondsPassed = 0
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            if let soundURL = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                } catch {
                    print("Error loading sound: \(error.localizedDescription)")
                }
            }
        }

    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        progressBar.progress = 1.0
        timer.invalidate()
        
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTime[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        countdawnLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
        @objc func updateTimer() {
            //example functionality
            if secondsPassed < totalTime {
                
                
                secondsPassed += 1
                progressBar.progress = Float(secondsPassed) / Float(totalTime)
                
                
                
            } else {
                timer.invalidate()
                countdawnLabel.text = "Done"
                audioPlayer?.play()
            }
        }
        
        
        
    }
    

