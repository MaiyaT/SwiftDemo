//
//  DelegateViewController.swift
//  YHSwiftDemo
//
//  Created by 林宁宁 on 2017/4/30.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit
import SnapKit

class DelegateViewController: BaseViewController ,PassDelegate{

    
    lazy var passLab = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        passLab.textAlignment = .center
        passLab.backgroundColor = (RGBColor(10,10,10)).withAlphaComponent(0.1)
        passLab.font = UIFont.systemFont(ofSize: 20)
        passLab.textColor = UIColor.black
        self.view.addSubview(passLab)
        
        passLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.view).offset(30)
            make.height.equalTo(50)
        }
        
        
        let submit_btn = UIButton(type: .custom)
        submit_btn.setTitle("要传值", for: .normal)
        submit_btn.addTarget(self, action: #selector(submit_action), for: .touchUpInside)
        submit_btn.backgroundColor = UIColor.orange
        self.view.addSubview(submit_btn)
        
        submit_btn.snp.makeConstraints { (make) in
            make.top.equalTo(passLab.snp.bottom).offset(50)
            make.left.right.height.equalTo(passLab)
        }
    }
    
    
    func submit_action(){
        let vc = DelegatePassVViewController()
        vc.delegate = self as PassDelegate
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func passValue(string: String) {
        passLab.text = string
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
