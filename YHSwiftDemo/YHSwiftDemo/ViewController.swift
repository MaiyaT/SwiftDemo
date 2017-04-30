//
//  ViewController.swift
//  DouBan
//
//  Created by 林宁宁 on 2017/4/27.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit


//func printJSONObject(anyObject:AnyObject?){
//    
//    
//    if let anyObjecct = anyObject, let data = try?JSONSerialization.data(withJSONObject: anyObjecct, options: JSONSerialization.WritingOptions.prettyPrinted){
//        
//        print(NSString(data: data, encoding: 4)!)
//        
//    }
//}


class ViewController: UIViewController {

//    let seatchPath = "https://api.douban.com/v2/book/search"
//    var tag_key : String! = "Swift"
//    
//    var books = [Book]()
//    
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        let parameter = ["tag":tag_key,"start":0,"count":10,"field":"id,title,image,rating,author,publisher,pubdate"] as [String : AnyObject]
//        
//        YH_GET(URLString: seatchPath, parameter:parameter , showHUD: true, success: { (responseObj) in
//            
//            printJSONObject(anyObject: responseObj)
//        
//            guard let dict = responseObj as? [String:AnyObject] else{
//                return
//            }
//            
//            guard let list = dict["books"] as? [[String:AnyObject]] else{
//                return
//            }
//            
//            for dict in list{
//                
//                self.books.append(Book(dict: dict))
//            }
//            
//            print(self.books)
//            
//        }, failure: { (error) in
//            
//            print("ssss")
//            
//        })
//    }

    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}











