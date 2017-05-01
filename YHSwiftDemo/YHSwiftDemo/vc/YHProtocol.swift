//
//  YHProtocol.swift
//  YHSwiftDemo
//
//  Created by 林宁宁 on 2017/4/30.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import Foundation

//http://www.cocoachina.com/swift/20161219/18376.html


protocol Delgate_Student {
    
    //协议中定义属性 只能用var关键字来声明 必须定义是否可读可写
    var name:String{get set}  //定义一个可读写的
    var birthPlace:String{get} //定义一个只读的
    
    static var qualifition:String{get}
    
    
    
    
    //协议中定义方法 不能有默认值
    static func study()  //类方法
    mutating func changeName()   //实例方法
    
    
    
    
    
}


//结构体 puple结构体 遵循某协议协议 在struct中必须要声明协议中的三个属性
struct Puple:Delgate_Student {
    

    

    //声明值信息
    static var qualifition: String = "小学"

    var birthPlace: String = "北京"

    var name: String
    
    var grade: String
    
    
    
    
    //该方法是协议中方法的实现 他要改变struct中的属性 需要加上mutating
    //mutating 在协议中和本身的方法中两边都要声明
    mutating func changeName() {
        self.name = self.name + " 改变了"
    }
    
    static func study() {
        
        self.qualifition = self.qualifition + " 改变静态的"
    }
    
    
}





protocol Pet {
    
    //协议中的初始化器
    //构造函
    init(name : String)
    
}


//方法名 一样的协议
protocol TextOne{
    func text() -> Int
}

protocol TextTwo {
    func text() -> String
}




//协议继承

protocol OneProtocol {
    var one_value : Int{get}
}

protocol TwoProtocol {
    func eat_event(thing:String)
}

protocol ThreeProtocol:OneProtocol,TwoProtocol {
    
}




//class修饰之后 这个协议 只能被类遵守
protocol FourProtocol: class {
    func only_class()
}



/**
 assoctiated
 这里我们使用associatedtype为该属性的类型定义了一个别名WeightType，换言之在WeightCalculable中并不关心weight的类型是Int 还是Double或者是其他类型,他只是简单的告诉我们返回的类型是WeightType，至于WeightType到底是什么类型由遵守该协议的类中自己去定义
 */
protocol WeightCalcuable {
 
    //为WeightTYpe 属性定义的类型别名
    associatedtype WeightType
    var weight : WeightType {get}
    
}


struct MobilePhone:WeightCalcuable {

    typealias WeightType = Double

    var weight: Double
}

struct SpeedCar:WeightCalcuable {
    typealias WeightType = String
    var weight: String
}


//协议扩展

protocol Y_Score {
    
    var math:Int {get set}
    var english : Int{get set}
    
//    func mathPercent()->Double
}

//struct Y_Puple:Y_Score {
//    
//    func mathPercent() -> Double {
//        return Double(math) / Double(math+english)
//    }
//    var english: Int
//
//    var math: Int
//}

extension Y_Score{
    func mathPercent() -> Double {
        return Double(math) / Double(math+english)
    }
}



struct U_Info:Equatable {
    var u_name : String
    var u_age : Int
    var U_id : String
}

func == (u1:U_Info,u2:U_Info) ->Bool{
    return u1.U_id == u2.U_id
}























