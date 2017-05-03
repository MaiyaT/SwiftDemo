//
//  ClosureCaptureViewController.swift
//  YHSwiftDemo
//
//  Created by 林宁宁 on 2017/5/2.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit

//http://www.cocoachina.com/swift/20161019/17796.html

class ClosureCaptureViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //闭包（closure）会自动捕捉其所在上下文中的外部变量，即使是定义这些变量的上下文已经消失
//        struct B_Pet{
//            
//            var name : String
//            
//            init(name:String) {
//                self.name = name
//            }
//            
//            func printNameClosure() -> () -> Void {
//                return {print("1.============="+self.name)}
//            }
//        }
//        
//        var pet:B_Pet = B_Pet(name: "汪汪")
//        let cl = pet.printNameClosure()
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
