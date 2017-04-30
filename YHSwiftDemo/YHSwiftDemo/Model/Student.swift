//
//  Student.swift
//  YHSwiftDemo
//
//  Created by 林宁宁 on 2017/4/28.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit

class Student: NSObject {

    var name : String = ""
    var grade : Int = 0
    
    init?(json : [String : Any]) {
        
        guard
            let name = json["name"] as? String,
            let gradeString = json["grade"] as? String,
            let gradeDouble = Double(gradeString),
            let grade = Int(exactly: gradeDouble)
        
            else {
            return nil
        }
        
        self.name = name
        self.grade = grade
        
    }

}


func makeStudent(with data:Data) -> [Student] {
    
    guard
        let json = try?JSONSerialization.jsonObject(with: data, options: .allowFragments),
        let jsonArray = json as? [[String:Any]]
    else {
        return[]
    }
    
//    return jsonArray.flatMap {Student.init(json: $0)}
    return jsonArray.flatMap({ (el : [String : Any]) -> Student? in
        
        return Student(json: el)
        
    })
    
}



