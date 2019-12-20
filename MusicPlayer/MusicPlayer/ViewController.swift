//
//  ViewController.swift
//  MusicPlayer
//
//  Created by 조윤영 on 19/12/2019.
//  Copyright © 2019 조윤영. All rights reserved.
//

import UIKit
import AVFoundation
//AVFoundation은 다양한 Apple 플랫폼에서 사운드 및 영상 미디어의 처리, 제어, 가져오기 및 내보내기 등 광범위한 기능을 제공하는 프레임워크입니다.

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    //MARK: - Properties
    var player: AVAudioPlayer!
    var timer: Timer!
    
    // MARK: - IBOutlets
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var progressSlider: UISlider!


    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializePlayer()
        
    }
    
    @IBAction func touchUpPlayPauseButton(_ sender: UIButton)  {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            self.player?.play()
        }else {
            self.player?.pause()
        }
        
        if sender.isSelected {
            self.makeAndFireTimer()
        } else {
            self.invalidateTimer()
        }
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
//        print("slider value changed");
    }
    
    //MARK: - Methods
    //MARK: Custom Method
    func initializePlayer() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound") else{
            print("음원 파일 에셋을 가져올 수 없습니다")
            return
        }
        
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드: \(error.code), 메시지: \(error.localizedDescription)")
        }
        
        self.progressSlider.maximumValue = Float(self.player.duration)
        self.progressSlider.minimumValue = 0
        self.progressSlider.value = Float(self.player.currentTime)
        
    }
    
    func updateTimeLabelText(time: TimeInterval) {
        let minute: Int = Int(time/60)
        let second: Int = Int(time.truncatingRemainder(dividingBy: 60))
        let milisecond: Int = Int(time.truncatingRemainder(dividingBy: 1)*100)
        
        let timeText: String = String(format: "%02ld:%02ld:%02ld", minute, second, milisecond)
        
        self.timeLabel.text = timeText
    }
    
    func makeAndFireTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: {[unowned self](timer: Timer)in
            if self.progressSlider.isTracking{return}
            
            self.updateTimeLabelText(time: self.player.currentTime)
            self.progressSlider.value = Float(self.player.currentTime)
        })
        self.timer.fire()
    }
    
    //타이머해제
    func invalidateTimer() {
        self.timer.invalidate()
        self.timer = nil
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        guard let error:Error = error else{
            print("오디오 플레이어 디코드 오류발생")
            return
        }
        let message: String
        message = "오디오 플레이어 오류 발생 \(error.localizedDescription)"
        
        let alert: UIAlertController = UIAlertController(title:"알림", message:message,preferredStyle: UIAlertController.Style.alert)
        
        let okAction: UIAlertAction = UIAlertAction(title:"확인", style:UIAlertAction.Style.default) {
            (action: UIAlertAction)->Void in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.playPauseButton.isSelected = false
        self.progressSlider.value = 0
        self.updateTimeLabelText(time: 0)
        self.invalidateTimer()
    }

}

