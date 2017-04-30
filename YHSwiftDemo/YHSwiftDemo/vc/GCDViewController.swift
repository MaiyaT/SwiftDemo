//
//  GCDViewController.swift
//  YHSwiftDemo
//
//  Created by 林宁宁 on 2017/4/28.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit
import SnapKit
import MBProgressHUD
import Toast

class GCDViewController: BaseViewController {

    
    enum GCD_btn_type:Int {
        ///队列
        case queue = 1
        ///优先级
        case Qos
        
        case after
        
        case globalQueue
        
        case mainqueue
        
        case workItem
        
        case dispath_async
        
        case barrier
        
        case group_1
        
        case group_2
        
        case group_3
        
        case semaphore
        
        case count
        
        
        var type_value:Int {
            
            return self.rawValue
        }
        
        var type_des:String{
            switch self {
            case .queue: return "queue"
            case .Qos: return "Qos"
            case .group_1: return "group_1"
            case .group_2: return "group_2"
            case .group_3: return "group_3"
            case .after: return "after"
            case .globalQueue: return "globalQueue"
            case .workItem: return "workItem"
            case .barrier: return "barrier"
            case .dispath_async: return "dispath_async"
            case .semaphore: return "semaphore"
            case .mainqueue: return "mainqueue"
            default: return "...."
            }
        }
    }
    
    
    lazy var img_show = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let scrollV = UIScrollView()
        self.view.addSubview(scrollV)
        
        scrollV.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }


        var pre_btn : UIButton?
        
        for index in GCD_btn_type.queue.rawValue...GCD_btn_type.count.rawValue{
            
            let btn = UIButton()
            btn.setTitle(GCD_btn_type(rawValue: index)?.type_des, for: UIControlState.normal)
            btn.addTarget(self, action: #selector(btn_action(sender:)), for: .touchUpInside)
            btn.backgroundColor = ColorRandom
            btn.tag = index
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            scrollV.addSubview(btn)
            
            btn.snp.makeConstraints({ (make) in
                
                make.left.right.equalTo(scrollV)
                make.height.equalTo(60)
                if pre_btn != nil  {
                    make.top.equalTo((pre_btn?.snp.bottom)!).offset(10)
                }else{
                    make.top.equalTo(scrollV).offset(10)
                }
                make.width.equalTo(scrollV)
                
                if index == GCD_btn_type.count.rawValue{
                    make.bottom.equalTo(scrollV).offset(-20)
                }
            })
            
            pre_btn = btn
        }
        
        
        
        img_show = UIImageView()
        img_show.contentMode = .scaleAspectFill
        img_show.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
//        img_show.backgroundColor = UIColor.red
        img_show.isUserInteractionEnabled = true
        img_show.layer.cornerRadius = 10
        img_show.layer.masksToBounds = true
        self.view.addSubview(img_show)
        
        img_show.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.width.height.equalTo(0)
        }
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap_action(gesture:)))
        img_show.addGestureRecognizer(tap)
    }

    //🔵🔴⚫️⚪️ ❤️💛💚💙💜🖤💔
    
    func btn_action(sender:UIButton) -> () {
        
        let type : GCD_btn_type = GCD_btn_type(rawValue: sender.tag)!
        
        switch type {
        case .queue:gcd_queue()
        case .Qos:gcd_Qos()
        case .after:gcd_after()
        case .globalQueue:gcd_globalQueue()
        case .workItem:gcd_workItem()
        case .group_1:gcd_group_1()
        case .group_2:gcd_group_2()
        case .group_3:gcd_group_3()
        case .dispath_async:gcd_dispath_async()
        case .barrier:gcd_barrier()
        case .semaphore:gcd_semaphore()
        case .mainqueue:gcd_mainQueue()
        default: break
        }
    }
    
    
    
    func gcd_dispath_async() -> () {
        
        //全局队列操作之后，主线程刷新UI
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        DispatchQueue.global().async {
            
            let data = try? Data(contentsOf: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493452927758&di=5c9bb5082e7e13113dcfcc68921c58c7&imgtype=0&src=http%3A%2F%2Fimg.kuping.cc%2Fdata%2FMobileImages%2Fwallpaper%2F2014nian%2F3yue%2F1%2F22%2F28.jpg")!)
            
            let image = UIImage(data: data!)
            
            DispatchQueue.main.async {
                
                self.img_show.image = image
                
                self.show_img()
                
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }
        
    }
    
    func gcd_workItem() -> () {
        
        //dispatch_block_t
        var value = 10
        
        let workItem = DispatchWorkItem{
            value += 5
        }
        print("❤️ value = \(value)")
        workItem.perform()
        print("💛 value = \(value)")
        
        let queue = DispatchQueue.global(qos: .utility)
        
        queue.async(execute: workItem)//20
        queue.async(execute: workItem)//25
        queue.async(execute: workItem)//30
        
        workItem.notify(queue: queue) {
            print("💔 value = \(value)")
        }
    }
    
    func gcd_mainQueue() -> () {
        
        let image_url : URL = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493440348022&di=0d246905d3bc17cb1b18834fd11d7a69&imgtype=0&src=http%3A%2F%2Fd.5857.com%2Fxxjzf_150215%2Fdesk_006.jpg")!

        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        URLSession(configuration: URLSessionConfiguration.default).dataTask(with: image_url) { (imageData, response, error) in
            
            if let data = imageData{
                
                let imgage = UIImage(data: data)
                
                DispatchQueue.main.async {
                    
                    self.img_show.image = imgage
                    
                    self.show_img()
                }
            }
        
            DispatchQueue.main.async {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
            
        }.resume()
    }
    
    func gcd_globalQueue() -> () {
        
        let globalQueue1 = DispatchQueue.global()
        let globalQueue2 = DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated)
        
        globalQueue1.async {
            for i in 0..<10{
                print("🔴 \(i)")
            }
        }
        
        globalQueue2.async {
            for i in 0..<10{
                print("🔵 \(i)")
            }
        }
        
        
        DispatchQueue.main.async {
            for i in 0..<10{
                print("❤️ \(i)")
            }
        }
        
    }
    
    func gcd_after() -> () {
        
        let queue1 = DispatchQueue(label: "com.yh.queue1.after")
        
        let addittionTime:DispatchTimeInterval = .seconds(2)
        
        print("\(Date())===\(Date().description)")
        
        queue1.asyncAfter(deadline: DispatchTime.now()+addittionTime) { 
            
            print("\(Date())===\(Date().description)")
        }
        
    }
    
    func gcd_Qos() -> () {
        
        let queue1 = DispatchQueue(label: "com.yh.queue1", qos: DispatchQoS.userInitiated, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
        
        let queue2 = DispatchQueue(label: "com.yh.queue2", qos: DispatchQoS.utility, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
        
        let queue3 = DispatchQueue(label: "com.yh.queue3", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
        
        
        
        
        queue1.async {
            for i in 0..<10{
                print("🔴 \(i)")
            }
        }
        
        queue2.async {
            for i in 0..<10 {
                print("🔵 \(i)")
            }
        }
        
        queue3.async {
            for i in 0..<10 {
                print("⚫️ \(i)")
            }
        }
        

//        if #available(iOS 10.0, *) {
//            
//            let queue4 = DispatchQueue(label: "com.yh.queue4", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.initiallyInactive, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
//            
//            print("queue4")
//            queue4.async {
//                for i in 0..<10 {
//                    print("❤️ \(i)")
//                }
//            }
//        }
  
        for i in 0..<10 {
            print("⚪️ \(i)")
        }
    }
    
    func gcd_queue() -> () {
        print("queue")
        
//        //同步队列
//        let queue_serial = DispatchQueue(label: "queue_serial_name")
//        //并发队列
//        let queue_concurret = DispatchQueue(label: "queue_concurrent_name", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
        
        let queue = DispatchQueue(label: "com.yh.queue")

        queue.sync {
            for i in 0..<10{
                print("🔴 \(i)")
            }
        }
        
        for i in 0..<10 {
            print("🔵 \(i)")
        }
        
        queue.async {
            for i in 0..<10{
                print("⚫️ \(i)")
            }
        }
        
        for i in 0..<10 {
            print("⚪️ \(i)")
        }
    }
    
    func gcd_group_1() -> () {
        print("group")
        
        //所有操作完成之后 执行某个动作
        
        let group = DispatchGroup()
        
        let queue_1 = DispatchQueue(label: "com.yh.down.task_1")
        
        queue_1.async(group: group, execute: DispatchWorkItem(block: { 
        
            for i in 0..<10{
                print("🔴 \(i)")
            }
            
        }))
        
        let queue_2 = DispatchQueue(label: "com.yh.down.task_2")
        
        queue_2.async(group: group, execute: DispatchWorkItem(block: {
            
            for i in 0..<10{
                print("🔵 \(i)")
            }
            
        }))
        
        
        group.notify(queue: DispatchQueue.main) { 
            
            print("操作完成")
            
        }
        
        for i in 0..<10{
            print("⚫️ \(i)")
        }
    }
    
    
    func gcd_barrier() -> () {
        
        let queue = DispatchQueue(label: "com.yh.queue.concurrent.barrier.images", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
        
        queue.async(execute: DispatchWorkItem(block: {
            
            for i in 0..<10{
                print("🔵 \(i)")
            }
            
        }))
        
        
        
        queue.async(execute: DispatchWorkItem(block: {
            for i in 0..<10{
                print("🔴 \(i)")
            }
        }))
        
        
        queue.async(execute: DispatchWorkItem(qos: .default, flags: .barrier) {
            
            for i in 0..<10{
                print("⚫️ \(i)")
            }
            
        })
        
        
        
        queue.async(execute: DispatchWorkItem(block: {
            
            for i in 0..<10{
                print("⚪️ \(i)")
            }
        }))
        
        
        
       
        print("这里走不走")
        
    }
    
    
    func gcd_semaphore() -> () {
        
        //信号量小于0的时候 卡主 不往下执行
        let sempahore = DispatchSemaphore(value: 0)
        
        URLSession(configuration: URLSessionConfiguration.default).dataTask(with: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493454678597&di=841e18a99f29a3a164b37b3ed2c539f6&imgtype=0&src=http%3A%2F%2Fi2.download.fd.pchome.net%2Ft_320x520%2Fg1%2FM00%2F0A%2F1F%2FooYBAFP_8h-IXY9KAADaBdDUxGkAAB4sQPBX4kAANod711.jpg")!, completionHandler: { (data, response, error) in
            
            if let imageData = data {
                let image = UIImage(data: imageData)
                DispatchQueue.main.async(execute: { 
                  self.img_show.image = image
                })
            }
            
            print("信号量加一")
            sempahore.signal()
            
        }).resume()
        
        print("信号量减一")
        sempahore.wait()
        
        print("任务完成")
        show_img()
    }
    
    func gcd_group_3() -> () {
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        var images = [UIImage]()
        
        let group = DispatchGroup()
        
        group.enter()
        URLSession(configuration: URLSessionConfiguration.default).dataTask(with: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493454678597&di=841e18a99f29a3a164b37b3ed2c539f6&imgtype=0&src=http%3A%2F%2Fi2.download.fd.pchome.net%2Ft_320x520%2Fg1%2FM00%2F0A%2F1F%2FooYBAFP_8h-IXY9KAADaBdDUxGkAAB4sQPBX4kAANod711.jpg")!, completionHandler: { (data, response, error) in
            
            if let imageData = data {
                let image = UIImage(data: imageData)
                images.append(image!)
            }
            
            print("图片一下载完成")
            group.leave()
            
        }).resume()
        
        
        group.enter()
        URLSession(configuration: URLSessionConfiguration.default).dataTask(with: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493454678596&di=3c937fe7734d6db66f2e638104596726&imgtype=0&src=http%3A%2F%2Fd.5857.com%2Fxxjzf_150215%2Fdesk_006.jpg")!, completionHandler: { (data, response, error) in
            
            if let imageData = data {
                let image = UIImage(data: imageData)
                images.append(image!)
            }
            print("图片二下载完成")
            group.leave()
            
        }).resume()
        
        
        group.wait()
        
        //图片三要等待图片 1 和 2 下完 完成之后才下
        group.enter()
        URLSession(configuration: URLSessionConfiguration.default).dataTask(with: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493454678595&di=59912cdadb13e1e7431a1b0b9bab4ceb&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fblog%2F201409%2F12%2F20140912014711_yQvBz.thumb.700_0.jpeg")!, completionHandler: { (data, response, error) in
            
            if let imageData = data {
                let image = UIImage(data: imageData)
                images.append(image!)
            }
            print("图片三下载完成")
            group.leave()
            
        }).resume()
        
        
        
        group.enter()
        URLSession(configuration: URLSessionConfiguration.default).dataTask(with: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493454678595&di=59912cdadb13e1e7431a1b0b9bab4ceb&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fblog%2F201409%2F12%2F20140912014711_yQvBz.thumb.700_0.jpeg")!, completionHandler: { (data, response, error) in
            
            if let imageData = data {
                let image = UIImage(data: imageData)
                images.append(image!)
            }
            print("图片四下载完成")
            group.leave()
            
        }).resume()
        
        group.notify(queue: DispatchQueue.main) {
            
            print("任务完成")
            
            self.show_img()
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.4, execute: {
                
                self.img_show.animationImages = images
                self.img_show.animationDuration = 1.5
                self.img_show.animationRepeatCount = 0
                
                self.img_show.startAnimating()
                
                MBProgressHUD.hide(for: self.view, animated: true)
            })
        }
        
        print("这里先走")
        
    }
    
    func gcd_group_2() -> () {
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        var images = [UIImage]()
        
        let group = DispatchGroup()
        let queue = DispatchQueue(label: "com.yh.queue.concurrent.images", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
       
        
        group.enter()
        
        queue.async {
            
            URLSession(configuration: URLSessionConfiguration.default).dataTask(with: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493452927757&di=437c0acd4569395ce5f91789add8a277&imgtype=0&src=http%3A%2F%2Fdownload.pchome.net%2Fwallpaper%2Fpic-3572-7-640x1136.jpg")!, completionHandler: { (data, response, error) in
                
                if let imageData = data {
                    let image = UIImage(data: imageData)
                    images.append(image!)
                }
                
                print("图片一下载完成")
                group.leave()
                
            }).resume()
            
        }
        
        
        
        group.enter()
        URLSession(configuration: URLSessionConfiguration.default).dataTask(with: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493454678596&di=3c937fe7734d6db66f2e638104596726&imgtype=0&src=http%3A%2F%2Fd.5857.com%2Fxxjzf_150215%2Fdesk_006.jpg")!, completionHandler: { (data, response, error) in
            
            if let imageData = data {
                let image = UIImage(data: imageData)
                images.append(image!)
            }
            print("图片二下载完成")
            group.leave()
            
        }).resume()
        
        
        group.enter()
        URLSession(configuration: URLSessionConfiguration.default).dataTask(with: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493454678595&di=59912cdadb13e1e7431a1b0b9bab4ceb&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fblog%2F201409%2F12%2F20140912014711_yQvBz.thumb.700_0.jpeg")!, completionHandler: { (data, response, error) in
            
            if let imageData = data {
                let image = UIImage(data: imageData)
                images.append(image!)
            }
            print("图片三下载完成")
            group.leave()
            
        }).resume()
        
        group.notify(queue: DispatchQueue.main) {
            
            print("任务完成")
            
            self.show_img()
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.4, execute: {
                
                self.img_show.animationImages = images
                self.img_show.animationDuration = 1.5
                self.img_show.animationRepeatCount = 0
                
                self.img_show.startAnimating()
                
                MBProgressHUD.hide(for: self.view, animated: true)
            })
        }
        
        print("这里先走")
    }
    
    
    func show_img() -> () {
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.curveEaseInOut, animations: { 
            
            self.img_show.snp.updateConstraints({ (make) in
                make.width.equalTo(Screen_width*0.9)
                make.height.equalTo(View_height*0.9)
            })
            
            self.view.layoutIfNeeded()
            
        }, completion: { (finish) in
            
            self.view.makeToast("点击图片关闭")
            
        })
        
    }
    
    
    func tap_action(gesture:UITapGestureRecognizer) -> () {
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            
            self.img_show.snp.updateConstraints({ (make) in
                make.width.equalTo(0)
                make.height.equalTo(0)
            })
            
            self.img_show.stopAnimating()
            self.img_show.animationImages = []
            
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
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
