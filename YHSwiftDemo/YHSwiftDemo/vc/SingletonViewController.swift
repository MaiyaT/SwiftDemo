//
//  SingletonViewController.swift
//  YHSwiftDemo
//
//  Created by 林宁宁 on 2017/5/1.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit
import SnapKit

class SingletonViewController: BaseViewController {

    lazy var lab_count = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lab_count.textAlignment = .center
        lab_count.backgroundColor = (RGBColor(10,10,10)).withAlphaComponent(0.1)
        lab_count.font = UIFont.systemFont(ofSize: 20)
        lab_count.textColor = UIColor.black
        self.view.addSubview(lab_count)
        
        lab_count.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.view).offset(30)
            make.height.equalTo(50)
        }
        
        CountManager.shared.count += 1
        
        lab_count.text = "进入了\(CountManager.shared.count)次"
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




class CountManager {
    
    //http://www.cocoachina.com/bbs/read.php?tid-208372.html
    
    var count = 0
    
//    class var shared: CountManager {
//        
//        if (Inner.instance == nil){
//            Inner.instance = CountManager()
//        }
//        
//        return Inner.instance!
//    }
// 
//    struct Inner {
//        static var instance : CountManager?
//    }

    
    
    class var shared: CountManager {
        return Inner.instance
    }
    
    struct Inner {
        static let instance = CountManager()
    }
    
}




