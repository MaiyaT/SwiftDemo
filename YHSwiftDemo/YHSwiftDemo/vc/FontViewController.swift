//
//  FontViewController.swift
//  DouBan
//
//  Created by 林宁宁 on 2017/4/28.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit
import SnapKit

class FontViewController: BaseViewController {

    lazy var contentLabel = UILabel()
    lazy var changeBtn = UIButton()
    var fontList = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.black
        
        contentLabel.frame = CGRect(x: 10, y: 20, width: Screen_width-20, height: 200)
        contentLabel.numberOfLines = 0
        contentLabel.textColor = UIColor.white
        contentLabel.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(contentLabel)
        
        
        let content: String = "Objective-C Swift\n\n 目前授权个人免费非商业使用\n\n 所以捐款了1元下了3款字体用来做试验\n\n 分别是造字工房劲黑，致黑和童心；"
        contentLabel.text = content
        
        
        changeBtn.backgroundColor = UIColor.orange
//        changeBtn.frame.size = CGSize(width: 100, height: 100)
//        changeBtn.frame.origin = CGPoint(x: Screen_width*0.5-50, y: self.view.frame.size.height - 120)
        changeBtn.setTitle("改变字体", for: UIControlState.normal)
        changeBtn.layer.masksToBounds = true
        changeBtn.layer.cornerRadius = 50
        changeBtn.addTarget(self, action: #selector(change_event), for: UIControlEvents.touchUpInside)
        self.view.addSubview(changeBtn)
        
        changeBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.view).offset(-20)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        fontList = getAllFont() as! [String]
        
    }

    func change_event(){
        
        let index:UInt32 = arc4random()%UInt32(fontList.count)

        let font_str:String = fontList[Int(index)]
        
        contentLabel.font = UIFont.init(name: font_str, size: 20)
    }
    
    
    func getAllFont() -> Array<Any> {
        
        var list = [String]()
        
        for family in UIFont.familyNames{
         
            for font in UIFont.fontNames(forFamilyName: family){
                list.append(font)
            }
        }
        
        return list
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
