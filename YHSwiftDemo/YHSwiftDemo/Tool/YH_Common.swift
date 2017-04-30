//
//  YH_Common.swift
//  DouBan
//
//  Created by 林宁宁 on 2017/4/28.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit


let Screen_width = UIScreen.main.bounds.size.width
let Screen_height = UIScreen.main.bounds.size.height

let View_height = Screen_height - 64


var RGBColor:(CGFloat,CGFloat,CGFloat)->UIColor = {red, green, blue in

    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1);
}


var RGBAColor:(CGFloat,CGFloat,CGFloat,CGFloat)->UIColor = {red, green, blue, alpha in
    
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha);
}

var ColorRandom : UIColor{

    let red:CGFloat = CGFloat((arc4random()%255)) / 255.0
    let green:CGFloat = CGFloat((arc4random()%255)) / 255.0
    let blue:CGFloat = CGFloat((arc4random()%255)) / 255.0
    
    return UIColor(red: red, green: green, blue: blue, alpha: 1);
}

class YH_Common: NSObject {

}



extension UIColor{
    
    class func RGB(red:CGFloat, green:CGFloat, blue:CGFloat) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1);
    }
    
    class func RGBA(red:CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha);
    }
    
}
