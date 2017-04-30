//
//  BaseNavcViewController.swift
//  YHSwiftDemo
//
//  Created by 林宁宁 on 2017/4/28.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit

class BaseNavcViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        var bg_img = UIImage()
//        
//        let bg_color = RGBColor(10,10,10)
//        
//        bg_color.p
        
//        self.navigationBar.setBackgroundImage(<#T##backgroundImage: UIImage?##UIImage?#>, for: <#T##UIBarMetrics#>)
        
        self.navigationBar.barStyle = .black
        self.navigationBar.isTranslucent = true
        
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
