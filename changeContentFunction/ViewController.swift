//
//  ViewController.swift
//  changeContentFunction
//
//  Created by 洪宗燦 on 2024/7/26.
//

import UIKit
import AVFAudio

class ViewController: UIViewController {
    let synthesizer = AVSpeechSynthesizer()
    
    let pics: [ImageResource] = [
        .情人的眼淚,
        .諾言,
        .上海灘
    ]
    let album = ["情人的眼淚","諾言","上海灘"]
    let lyrics = [
"""
為什麼要對你掉眼淚
你難道不明白是為了愛
只有那有情人眼淚最珍貴
一顆顆眼淚都是愛都是愛
為什麼要對你掉眼淚
你難道不明白是為了愛
要不是有情郎跟我要分開
我眼淚不會掉下來掉下來
""",

"""
我不明白這世界為什麼
會讓我感到那麼多傷悲
我不知道相愛的兩個人
留不住一個褪色的諾言
我不了解滄海桑田
能將一切相信的事改變
我不相信付出過的真心
要收回就能收回
""",

"""
浪奔 浪流 萬里滔滔江水永不休
淘盡了 世間事 混作滔滔一片潮流
是喜 是愁 浪裡分不清歡笑悲憂
成功 失敗 浪裡看不出有未有
愛你恨你 問君知否 似大江一發不收
     
轉千灣 轉千灘 亦未平復此中爭鬥
又有喜 又有愁 就算分不清歡笑悲憂
仍願翻 百千浪 在我心中起伏夠
"""
    ]
    
    
    
    
    var currentIndex = 0
    
    @IBOutlet weak var pageControl: UISegmentedControl!
    
    @IBOutlet weak var songImageView: UIImageView!
    
    @IBOutlet weak var lyricsLabel: UILabel!
    
    @IBOutlet weak var albumSelected: UISegmentedControl!
    
    @IBOutlet weak var pageControlChanged: UIPageControl!
    
    @IBAction func pre(_ sender: Any) {
        if(currentIndex==0){
            currentIndex = album.count - 1 }
        else
        {
            currentIndex -= 1
        }
        UpdateUI()
    }
    
    
    @IBAction func next(_ sender: Any) {
        currentIndex += 1
        if(currentIndex == album.count )
        {currentIndex = 0}
        UpdateUI()
    }
    @IBAction func segmentChanged(_ sender: Any) {
        currentIndex = albumSelected.selectedSegmentIndex
        UpdateUI()
    }
    @IBAction func SpeakOut(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: lyricsLabel.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        //utterance.rate = 0.1
        //utterance.pitchMultiplier = 2
        synthesizer.speak(utterance)
    }
    func UpdateUI(){
        
        
        
        
        songImageView.image = UIImage(resource: pics[currentIndex])
        lyricsLabel.text = lyrics[currentIndex]
        albumSelected.selectedSegmentIndex = currentIndex
        pageControlChanged.currentPage=currentIndex
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // 設置陰影顏色
        songImageView.layer.shadowColor = UIColor.black.cgColor
                // 設置陰影透明度
        songImageView.layer.shadowOpacity = 0.7
                // 設置陰影偏移
        songImageView.layer.shadowOffset = CGSize(width: 5, height: 5)
                // 設置陰影半徑
        songImageView.layer.shadowRadius = 10
                // 可選：設置陰影路徑以提高性能
        songImageView.layer.shadowPath = UIBezierPath(rect: songImageView.bounds).cgPath
        
        
        // Do any additional setup after loading the view.
    }
}

