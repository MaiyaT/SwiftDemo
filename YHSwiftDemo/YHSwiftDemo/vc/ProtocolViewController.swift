//
//  ProtocolViewController.swift
//  YHSwiftDemo
//
//  Created by 林宁宁 on 2017/4/30.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit

class ProtocolViewController: BaseViewController,FourProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var p1 = Puple(birthPlace: "小明", name: "上海", grade: "80.5")
        p1.name = "福州"
        
        print("struce_delegate_puple== \(p1) \n\n")
        print("Puple.qualifition == \(Puple.qualifition) \n\n")
        Puple.qualifition = "💰打扰"
        print("Puple.qualifition == \(Puple.qualifition) \n\n")
        
        
        var pro_s1:Delgate_Student = p1
        print("pro_s1 == \(pro_s1) \n\n")
//        pro_s1.birthPlace = "会报错 只读"
        
        pro_s1.changeName()
        
        print("pro_s1 changeName == \(pro_s1) \n\n")
        
        Puple.study()
        
        print("Puple.qualifition == \(Puple.qualifition) \n\n")
        
        
        
        let car_1 = Cat(name: "大猫")
        
        print("car_1 . name = \(car_1.name) \n\n")
        
        
//        let car_2 = Cat()  报错
//        
//        print("car_2 . name = \(car_2.name) \n\n")
        
        
        print("调用相同的text = \((car_1 as TextOne).text()) \n\n")
        print("调用相同的text = \((car_1 as TextTwo).text()) \n\n")
        
        
        text_protocol_juhe(parameters: car_1)
        
        
        
        //协议检测
        
        if car_1 is Delgate_Student{
            print(" \(car_1) 有实现了 Delgate_Student \n\n")
        }
        
        
        //关联类型 associate type
        
        let iphone7 = MobilePhone(weight: 0.138)
        let sCar = SpeedCar(weight: "33444t")
        
        print(" iphone7 == \(iphone7) sCar == \(sCar) \n\n")
    }

    
    func text_protocol_juhe(parameters : OneProtocol&TwoProtocol)  {
        
        print("参数 \(parameters)是 都实现了 OneProtocol和TwoProtocol \n\n")
        
    }
    
    func only_class() {
        
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



class Cat: Pet, TextOne,TextTwo,ThreeProtocol {
    
    var name : String = "Car"
    
    var one_value: Int = 30
    
    required init(name: String) {
        self.name = name
    }
    
    func text() -> Int {
        return 998
    }
    
    func text() -> String {
        return "998_str"
    }
    
    func eat_event(thing: String) {
        print("\(self.name) eat : == \(thing) \n\n")
    }
    
}
