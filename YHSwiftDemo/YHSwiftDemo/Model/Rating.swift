//
//  Rating.swift
//  DouBan
//
//  Created by 林宁宁 on 2017/4/27.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit

//评分
class Rating: NSObject {

    var min:CGFloat = 0.0
    var max:CGFloat = 0.0
    var numRaters = 0 //评价数
    var average:CGFloat = 0.0
    
    
    init(dict:[String:AnyObject]) {
        min = dict["min"] as? CGFloat ?? 0
        max = dict["max"] as? CGFloat ?? 0
        numRaters = dict["numRaters"] as? Int ?? 0
        if let average = dict["average"]?.floatValue {
            self.average = CGFloat(average*5)/max
        }
    }
    
    override init() {
        
    }
}
