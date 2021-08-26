//
//  ViewController.swift
//  animationApp
//
//  Created by worker on 2021/8/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
   
    func setupGradientBackground() {
         let gradientLayer = CAGradientLayer()
         gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 178/255, green: 116/255, blue: 124/255, alpha: 1).cgColor,UIColor(red: 127/255, green: 154/255, blue: 184/255, alpha: 1).cgColor,UIColor(red: 203/255, green: 202/255, blue: 181/255, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.locations = [0, 0.4, 0.9]
         view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
  
    override func viewDidLoad() {
       super.viewDidLoad()
        //呼叫出設定好的漸層
        setupGradientBackground()

        //製作動畫
        /*呼叫 CGAnimateImageAtURLWithBlock 產生的動畫圖片將在 closure 的第二個參數裡，它的型別是 CGImage，因此我們可將它變成 UIImage，然後顯示到 image view*/
       guard let url = Bundle.main.url(forResource: "girl", withExtension: "gif") else { return }
       let cfUrl = url as CFURL
       CGAnimateImageAtURLWithBlock(cfUrl, nil) { (_, cgImage, _) in
                self.imageView.image = UIImage(cgImage: cgImage)

       }

        
        //製作珍珠項鍊
        let pearlEmitterCell = CAEmitterCell()
        //設定粒子的內容，contents要求的型別是CGImage，因此生成UIIMAGE後，要再讀取型別CGImage
        pearlEmitterCell.contents = UIImage(named: "pearl1")?.cgImage
        //設定每秒射出幾個珍珠，指定1秒5個
        pearlEmitterCell.birthRate = 20
        //珍珠維持的秒數
        pearlEmitterCell.lifetime = 15
        //珍珠移動的速度
        pearlEmitterCell.velocity = 100
        pearlEmitterCell.velocityRange = 10
        //設定向下移動的加速度，當 yAcceleration > 0 時會向下移動，yAcceleration ＜ 0 時會向上移動//
        pearlEmitterCell.yAcceleration = 30
        //設定向右移動，xAcceleration > 0 會向右移動
        pearlEmitterCell.xAcceleration = 10

        //珍珠的大小和縮小放大範圍
            pearlEmitterCell.scale = 0.1
            pearlEmitterCell.scaleRange = 0.2
            
        //珍珠大小改變的速度，小於 0 會愈來愈小，大於 0 會愈來愈大
            pearlEmitterCell.scaleSpeed = -0.02
        // 旋轉珍珠單位是弧度
            pearlEmitterCell.spin = 0.5
            pearlEmitterCell.spinRange = 1
        //珍珠發射角度範圍
            pearlEmitterCell.emissionRange = CGFloat.pi
        // 產生 CAEmitterLayer，將它的 emitterCells指定給pearlEmitterCell
        let pearlEmitterLayer = CAEmitterLayer()
            pearlEmitterLayer.emitterCells = [pearlEmitterCell]
        //發射路徑
        pearlEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2, y: -50)
        pearlEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        pearlEmitterLayer.emitterShape = .line
        //pearlEmitterLayer加在view的layer
        view.layer.addSublayer(pearlEmitterLayer)
        
        //製作珍珠耳環
            let pearl2EmitterCell = CAEmitterCell()
            //設定粒子的內容，contents要求的型別是CGImage，因此生成UIIMAGE後，要再讀取型別CGImage
            pearl2EmitterCell.contents = UIImage(named: "earrings")?.cgImage
            //設定每秒射出幾個珍珠，指定1秒5個
            pearl2EmitterCell.birthRate = 13
            //珍珠維持的秒數
            pearl2EmitterCell.lifetime = 10
            //珍珠移動的速度
            pearl2EmitterCell.velocity = 100
            pearl2EmitterCell.velocityRange = 10
            //設定向下移動的加速度，當 yAcceleration > 0 時會向下移動，yAcceleration ＜ 0 時會向上移動//
            pearl2EmitterCell.yAcceleration = 30
            //設定向右移動，xAcceleration > 0 會向右移動
            pearl2EmitterCell.xAcceleration = -10

            //珍珠的大小和縮小放大範圍
                pearl2EmitterCell.scale = 0.1
                pearl2EmitterCell.scaleRange = 0.1
                
            //珍珠大小改變的速度，小於 0 會愈來愈小，大於 0 會愈來愈大
                pearl2EmitterCell.scaleSpeed = -0.02
            // 旋轉珍珠單位是弧度
                pearl2EmitterCell.spin = 0.5
                pearl2EmitterCell.spinRange = 1
            //珍珠發射角度範圍
                pearl2EmitterCell.emissionRange = CGFloat.pi
            // 產生 CAEmitterLayer，將它的 emitterCells指定給pearl2EmitterCell
            let pearl2EmitterLayer = CAEmitterLayer()
                pearl2EmitterLayer.emitterCells = [pearl2EmitterCell]
            //發射路徑
            pearl2EmitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2, y: -50)
            pearl2EmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
            pearl2EmitterLayer.emitterShape = .line
            //pearl2EmitterLayer加在view的layer
            view.layer.addSublayer(pearl2EmitterLayer)

        
        
        
        
        
    }

        
}
