//
//  ClassEnumStruceViewController.swift
//  YHSwiftDemo
//
//  Created by 林宁宁 on 2017/4/29.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit


enum StudentType : Int{
    case pupil = 1
    case middleSchool = 100
    case college = 1000
}

enum Student_Name : String{
    case zhang = "张"
    case wang = "王"
    case lin = "林"
    case wuyue
}

enum S_Daily {
    case morning(String)
    case nooning([String])
    case evening([[String:String]])
    case sunup(Int, String)
    case sunset(time:Int, thing:String, other:String)
}




struct Student_Grade {
    var chinese : Int = 99
    var math : Int = 98
    var english : Int = 97
    
    init() {
        
    }
    
    init(chinese:Int, math:Int, english:Int) {
        self.chinese = chinese
        self.math = math
        self.english = english
    }

    init(stringScore: String) {
//        let cme = stringScore.characters.split(separator: ",")
//        chinese = Int(atoi(String(describing: cme.first)))
//        math = Int(atoi(String(describing: cme[1])))
//        english = Int(atoi(String(describing: cme.last)))
//        
        
        let list_str = stringScore.components(separatedBy: ",")
        if list_str.count == 3 {
            chinese = Int(list_str.first!)!
            math = Int(list_str[1])!
            english = Int(list_str.last!)!
        }
    }
    
    //需改数学成绩
    mutating func changeMath(num:Int){
        self.math += num
    }
}



class ClassEnumStruceViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // MARK: ======= enum 枚举 ========
        
        print("======= enum 枚举 ========")
        
        print("rawValue -> pupil = \(StudentType.pupil.rawValue)  middle = \(StudentType.middleSchool.rawValue)  college = \(StudentType.college.rawValue)")
        
        let student_1 = StudentType(rawValue: 100)
        let student_2 = StudentType(rawValue: 999)
        
        print("student_1 = \(String(describing: student_1)),  student_2 = \(String(describing: student_2))")
        
        print("zhang = \(Student_Name.zhang.rawValue)  wang = \(Student_Name.wang.rawValue)  lin = \(Student_Name.lin.rawValue) wu = \(Student_Name.wuyue.rawValue)")
        
        
        
        let daily_1 = S_Daily.morning("睡觉")
        let daily_2 = S_Daily.nooning(["上班","swift","吃"])
        let daily_3 = S_Daily.evening([["加班":"到半夜"],["手机":"微博小说"],["买菜":"土豆"]])
        let daily_4 = S_Daily.sunup(9, "上班")
        let daily_5 = S_Daily.sunset(time: 18, thing: "下班", other: "步行")
        
        print("daily_1 = \(daily_1), daily_2 = \(daily_2), daily_3 = \(daily_3) , daily_4 = \(daily_4) , daily_5 = \(daily_5) ")
        
        daily_value(type: daily_1)
        daily_value(type: daily_2)
        daily_value(type: daily_3)
        daily_value(type: daily_4)
        daily_value(type: daily_5)
        
        
        print("============  struck 结构体 ==============")
        
        
        // MARK: ============  struck 结构体 ==============
        
        var grade_1 = Student_Grade(chinese: 20, math: 80, english: 30)
        //有初始值的时候可以这么写
        var grade_2 = Student_Grade()
        var grade_3 = Student_Grade(stringScore: "80,23,123")
        
        var grade_4 = grade_2
        var grade_5 = grade_3
        
        //修改结构体中的某个属性
        grade_1.math += 99
        grade_2.changeMath(num: 111)
        changeChinese(num: 20, grade: &grade_3)
        
        print("grade_1 == \(grade_1),  grade_2 == \(grade_2),  grade_3 == \(grade_3)")
        
        //grade_4 和 grade_5 中的属性不会变化
        print("grade_2 == \(grade_2),  grade_4 == \(grade_4)")
        print("grade_3 == \(grade_3),  grade_5 == \(grade_5)")
        
        /**
         
         http://www.cocoachina.com/swift/20161221/18377.html
         
         //表示数值类型的结构体：
         Int，Float，Double，CGFloat...
         //表示字符和字符串类型的结构体
         Character，String...
         //位置和尺寸的结构体
         CGPoint，CGSize...
         //集合类型结构体
         Array，Set，Dictionary...
         
         
         枚举、结构体、类的共同点：
         
         定义属性和方法；
         下标语法访问值；
         初始化器；
         支持扩展增加功能；
         可以遵循协议；
         类特有的功能：
         
         继承；
         允许类型转换；
         析构方法释放资源；
         引用计数；
         
         
         1.什么时候该用值类型：
         
         要用==运算符来比较实例的数据时
         你希望那个实例的拷贝能保持独立的状态时
         数据会被多个线程使用时
         2.什么时候该用引用类型（class）：
         
         要用==运算符来比较实例身份的时候
         你希望有创建一个共享的、可变对象的时候
         
         */
        
    }
    
    func daily_value(type:S_Daily) -> () {
        
        switch type {
        case .morning(let value):
            print("morning === \(value)")
        case .nooning(let list):
            print("nooning === \(list)")
        case .evening(let list_dic):
            print("evening === \(list_dic)")
        case .sunup(let time, let thing):
            print("sunup === \(time)点 \(thing)")
        case .sunset(let time,let thing,let other):
            print("sunset === \(time) \(thing) + \(other)")
        default:
            break
        }
        
    }
    
    
    func changeChinese(num:Int, grade:inout Student_Grade)->(){
        
        grade.chinese += num
        
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
