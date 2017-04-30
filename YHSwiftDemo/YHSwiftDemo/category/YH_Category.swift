//
//  YH_Category.swift
//  YHSwiftDemo
//
//  Created by 林宁宁 on 2017/4/28.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit

class YH_Category: NSObject {

}

//MARK: 这是一个分割线

extension UITextField{
    
    func buildInputAccessoryDone() -> () {
        
        let toolBar = UIToolbar()
        toolBar.barTintColor = UIColor.white
        toolBar.frame = CGRect(x: 0, y: 0, width: Screen_width, height: 44)
        
        
        let lineV = UIView(frame: CGRect(x: 0, y: 43.5, width: Screen_width, height: 0.5))
        lineV.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        toolBar.addSubview(lineV)
        
        
        let done = UIBarButtonItem(title: "确定", style: UIBarButtonItemStyle.plain, target: self, action: #selector(done_action))
        
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.items = [space,done]
        
        self.inputAccessoryView = toolBar
    }
    
    
    func done_action(){
        self.resignFirstResponder()
    }
}





extension UserDefaults{
    
    public enum YH_UserDefault_Key:Int{
        
        case TextInput
        
        case HomeFirstOpen
        
        case nothing
        
        //普通方法
        func toString() -> String {
            
            var value_str:String
            
            switch self {
            case .TextInput:
                value_str = "YH_UserDefault_Key_TextInput"
            case .HomeFirstOpen:
                value_str = "YH_UserDefault_Key_HomeFirstOpen"
            default:
                value_str = "other"
            }
            
            return value_str
        }
        
        
        //静态方法
        static func getSting(key:YH_UserDefault_Key) ->String{
            
            var value_str:String
            
            switch key {
            case .TextInput:
                value_str = "YH_UserDefault_Key_TextInput"
            case .HomeFirstOpen:
                value_str = "YH_UserDefault_Key_HomeFirstOpen"
            default:
                value_str = "other"
            }
            
            return value_str
            
        }
        
        
        //成员
        var description:String{
            
            var value_str:String
            
            switch self {
            case .TextInput:
                value_str = "YH_UserDefault_Key_TextInput"
            case .HomeFirstOpen:
                value_str = "YH_UserDefault_Key_HomeFirstOpen"
            default:
                value_str = "other"
            }
            
            return value_str
        }
        
    }
    
    
    
    
}
