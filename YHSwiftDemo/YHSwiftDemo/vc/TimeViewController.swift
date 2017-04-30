//
//  TimeViewController.swift
//  DouBan
//
//  Created by 林宁宁 on 2017/4/27.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit
import SnapKit


class TimeViewController: BaseViewController {

    lazy var topBox = UIView()
    lazy var bottomLeft = UIView()
    lazy var bottomRight = UIView()
    lazy var resetBtn = UIButton()
    lazy var startBtn = UIButton()
    lazy var pauseBtn = UIButton()
    lazy var numberLabel = UILabel()
    
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(topBox)
        self.view.addSubview(bottomLeft)
        self.view.addSubview(bottomRight)
        
        topBox.backgroundColor = RGBColor(8,1,34)
        bottomRight.backgroundColor = RGBColor(82,91,252)
        bottomLeft.backgroundColor = RGBColor(102,189,9)
        
        topBox.snp.makeConstraints { (make) in
            make.width.equalTo(Screen_width)
            make.height.equalTo(Screen_height*0.4)
            make.left.equalTo(self.view)
            make.top.equalTo(self.view)
        }
        
        bottomLeft.snp.makeConstraints { (make) in
            make.left.bottom.equalTo(self.view)
            make.top.equalTo(topBox.snp.bottom)
            make.right.equalTo(self.view.snp.centerX)
        }
        
        bottomRight.snp.makeConstraints { (make) in
            make.bottom.right.equalTo(self.view)
            make.top.equalTo(topBox.snp.bottom)
            make.left.equalTo(self.view.snp.centerX)
        }
        
        
        resetBtn.setTitle("Reset", for: UIControlState.normal)
        resetBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        resetBtn.addTarget(self, action: #selector(reset_event), for: UIControlEvents.touchUpInside)
        self.topBox.addSubview(resetBtn)
        
        resetBtn.snp.makeConstraints { (make) in
            make.width.equalTo(120)
            make.top.equalTo(topBox).offset(20)
            make.height.equalTo(20)
            make.right.equalTo(topBox.snp.right).offset(-20)
        }
        
        
        numberLabel.text = "0.0"
        numberLabel.font = UIFont.boldSystemFont(ofSize: 100)
        numberLabel.textColor = UIColor.white
        numberLabel.textAlignment = .center
        topBox.addSubview(numberLabel)
        
        numberLabel.snp.makeConstraints { (make) in
            make.center.equalTo(topBox)
            make.width.equalTo(topBox)
            make.height.equalTo(100)
        }
        
        
        startBtn.setTitle("开始", for: UIControlState.normal)
        startBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        startBtn.addTarget(self, action: #selector(start_event), for: UIControlEvents.touchUpInside)
        bottomLeft.addSubview(startBtn)
        
        startBtn.snp.makeConstraints { (make) in
            make.edges.equalTo(bottomLeft)
        }
        
        
        pauseBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        pauseBtn.setTitle("停止", for: UIControlState.normal)
        pauseBtn.addTarget(self, action: #selector(pause_event), for: UIControlEvents.touchUpInside)
        bottomRight.addSubview(pauseBtn)
        
        pauseBtn.snp.makeConstraints { (make) in
            make.edges.equalTo(bottomRight)
        }
        
    }

    
    func reset_event() {
        
        startBtn.isUserInteractionEnabled = true
        pauseBtn.isUserInteractionEnabled = true
        
        numberLabel.text = "0.0"
        timer.invalidate()
    }
    
    func start_event(){
        startBtn.isUserInteractionEnabled = false
        pauseBtn.isUserInteractionEnabled = true
        
        if (timer != nil) {
            timer.invalidate()
            timer = nil
        }
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(numberChange), userInfo: self, repeats: true)
        timer.fire()
    }
    
    func pause_event(){
        pauseBtn.isUserInteractionEnabled = false
        startBtn.isUserInteractionEnabled = true
        
        timer.invalidate()
    }
    
    func numberChange(){
        let number = NSString(string: numberLabel.text!).doubleValue
        let changeNumber = number + 0.1
        numberLabel.text = "\(changeNumber)"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
