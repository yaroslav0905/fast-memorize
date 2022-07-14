//
//  ViewController.swift
//  fast-memorize
//
//  Created by Yaroslav Kambarov on 07.07.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var pasSimpleWord: UILabel!
    @IBOutlet weak var timeProgress: UIProgressView!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var gameScore: UILabel!
    
    let falseSound = Bundle.main.path(forResource: "false", ofType: "mp3")!
    let trueSound = Bundle.main.path(forResource: "true", ofType: "mp3")!
    
    var memoriz = WordsBrain()
    var timer = Timer()
    var totalTime = 10
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    @objc func Progress(){
        if secondsPassed <  totalTime {
            timeProgress.progress = Float(secondsPassed) / Float(totalTime)
            secondsPassed += 1
            
        } else {
            timer.invalidate()
            timeProgress.progress = 1.0
            secondsPassed = 0
            player = try! AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: falseSound))
            player.play()
            memoriz.scoreFalse += 1
            start()
        }
    }
    
    @objc func start(){
        gameScore.text = memoriz.gameScore()
        picture.image = UIImage(named: memoriz.setImage())
        word.text = memoriz.setVerb()
        pasSimpleWord.text = "Past participle: \(memoriz.setVerbPP())"
        buttonOne.setTitle(memoriz.setBtnText()[0], for: .normal)
        buttonTwo.setTitle(memoriz.setBtnText()[1], for: .normal)
        buttonThree.setTitle(memoriz.setBtnText()[2], for: .normal)
        buttonFour.setTitle(memoriz.setBtnText()[3], for: .normal)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(Progress), userInfo: nil, repeats: true)
        
        buttonOne.backgroundColor = UIColor.clear
        buttonTwo.backgroundColor = UIColor.clear
        buttonThree.backgroundColor = UIColor.clear
        buttonFour.backgroundColor = UIColor.clear
    }
    
    func checkGame(_ answer : String) {
        let userGotItRight = memoriz.checkAnswer(answer)
        var buttonNamber : UIButton!
        let setBtn = memoriz.buttonCheck(answer)
        switch setBtn {
        case 0:
            buttonNamber = buttonOne
        case 1:
            buttonNamber = buttonTwo
        case 2:
            buttonNamber = buttonThree
        case 3:
            buttonNamber = buttonFour
        default:
            break
        }
        if userGotItRight {
            timer.invalidate()
            memoriz.scoreTrue += 1
            secondsPassed = 0
            player = try! AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: trueSound))
            player.play()
            buttonNamber.backgroundColor = UIColor.green
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(start), userInfo: nil, repeats: false)
        } else {
            timer.invalidate()
            memoriz.scoreFalse += 1
            secondsPassed = 0
                player = try! AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: falseSound))
            player.play()
            buttonNamber.backgroundColor = UIColor.red
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(start), userInfo: nil, repeats: false)
        }
    }
    
    
    
    func restart(){
        timer.invalidate()
        secondsPassed = 0
        memoriz.scoreTrue = 0
        memoriz.scoreFalse = 0
        start()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }
    
    
    @IBAction func actionGame(_ sender: UIButton) {
        checkGame(sender.currentTitle!)
    }
    
    
    @IBAction func restartGame(_ sender: UIButton) {
        restart()
    }
    

}

