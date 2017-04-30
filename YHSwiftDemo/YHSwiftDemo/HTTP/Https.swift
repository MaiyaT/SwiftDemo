//
//  Https.swift
//  DouBan
//
//  Created by 林宁宁 on 2017/4/27.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit
import AFNetworking
import MBProgressHUD
import Toast

class Https: NSObject {

}


extension NSObject{
    
    func YH_GET(URLString:String,parameter:[String:AnyObject]?,showHUD:Bool = true,success:((AnyObject?)->Void)?,failure:((NSError)->Void)?)
    {
        let manager = AFHTTPSessionManager()
        manager.requestSerializer.timeoutInterval = 20
        let keywindow = UIApplication.shared.delegate!.window!;
        if showHUD{
            MBProgressHUD.showAdded(to: keywindow!, animated: true)
        }

        manager.get(URLString, parameters: parameter, progress: { (progress) in
            
            print("get_进度\(progress)")
            
        }, success: { (task, responseObject) in
            
            if showHUD{
                MBProgressHUD.hide(for: keywindow!, animated: true)
            }
            success?(responseObject as AnyObject)
            
        },failure: { (task, error) in
            
            if showHUD{
                MBProgressHUD.hide(for: keywindow!, animated: true)
                keywindow?.makeDefaultToast(message:"网络异常。请检查网络")
            }
          
            failure?(error as NSError)
        })
    }

    
    
    func YH_POST(URLString:String,parameter:[String:AnyObject]?,showHUD:Bool = true,success:((AnyObject?)->Void)?,failure:((NSError)->Void)? ) {
        
        let manager = AFHTTPSessionManager()
        manager.requestSerializer.timeoutInterval = 10
        let keywindow = UIApplication.shared.keyWindow!
        
        if showHUD
        {
            MBProgressHUD.showAdded(to: keywindow, animated: true)
        }
        
        manager.post(URLString, parameters: parameter, progress: { (progress) in
            
            print("post_进度\(progress)")
            
        }, success: { (task, responseObject) in
            
            if showHUD{
                MBProgressHUD.hide(for: keywindow, animated: true)
            }
            
            success?(responseObject as AnyObject)
            
        }, failure: { (task, error) in
            
            if showHUD{
                MBProgressHUD.hide(for: keywindow, animated: true)
                keywindow.makeDefaultToast(message: "网络异常，请检查网络")
            }
            
            failure?(error as NSError)
        })
        
    }
    
}








extension UIView{
    
    func makeDefaultToast(message:String) -> () {
        makeToast(message, duration: 2, position: CSToastPositionCenter)
    }
    
}



















