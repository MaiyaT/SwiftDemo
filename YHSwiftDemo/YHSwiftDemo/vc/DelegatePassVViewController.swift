//
//  DelegatePassVViewController.swift
//  YHSwiftDemo
//
//  Created by 林宁宁 on 2017/5/1.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit

class DelegatePassVViewController: BaseViewController {
    
    var delegate : PassDelegate?
    
    var passBlock : (_ text :String)->Void = {param in}
    
    lazy var textF = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        textF.placeholder = "传递数据"
        textF.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
        self.view.addSubview(textF)
        
        textF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 2))
        textF.leftViewMode = .always
        
        
        textF.buildInputAccessoryDone()
        
        textF.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.view).offset(20)
            make.height.equalTo(50)
        }
        
        
        
        
        let submit_btn = UIButton()
        submit_btn.setTitle("确定", for: UIControlState.normal)
        submit_btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        submit_btn.addTarget(self, action: #selector(submit_event), for: UIControlEvents.touchUpInside)
        submit_btn.backgroundColor = UIColor.orange
        self.view.addSubview(submit_btn)
        
        
        submit_btn.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.view)
            make.height.equalTo(50)
        }
    }
    
    func submit_event() {

        delegate?.passValue(string: textF.text!)
        
        passBlock(textF.text!)
        
        self.navigationController?.popViewController(animated: true)
        
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



protocol PassDelegate {
    
    func passValue(string : String)
    
}
