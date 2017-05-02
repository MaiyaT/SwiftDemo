//
//  BlockViewController.swift
//  YHSwiftDemo
//
//  Created by 林宁宁 on 2017/5/2.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit

//http://www.cocoachina.com/ios/20161201/18250.html

class BlockViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //一般形式
        let calAdd:(Int,Int)->Int = {
            (a:Int,b:Int) -> Int in
            return a+b
        }
        
        print("1.==============" + String(calAdd(100,150)))
        print("\n")
        
        
        //Swift可以根据闭包上下文推断参数和返回值的类型，所以上面的例子可以简化如下
        let calAdd2:(Int,Int)->Int = {
            a,b in
            return a + b
        }
        
        print("2.==============" + String(calAdd2(100,350)))
        print("\n")
        
        //上面省略了返回箭头和参数及返回值类型，以及参数周围的括号。当然你也可以加括号，为了好看点，看的清楚点。(a,b)
        
        //单行表达式闭包可以隐式返回，如下，省略return
        let calAdd3:(Int,Int)->Int = {a,b in a+b}
        print("3.==============" + String(calAdd3(100,330)))
        print("\n")
        
        
        //如果闭包没有参数，可以直接省略“in”
        let calAdd4:()->Int = {return 100+200}
        print("4.==============" + String(calAdd4()))
        print("\n")
        
        //这个是既没有参数也没返回值，所以把return和in都省略了
        let calAdd5:()->Void = {print("5.==============000")}
        calAdd5()
        print("\n")
        
        
        
        
        //起别名
        //也可以关键字“typealias”先声明一个闭包数据类型。类似于OC中的typedef起别名
        typealias AddBlock = (Int,Int)->(Int)
        
        let calAdd6:AddBlock = {
            (a,b) in
            return a+b
        }
        print("6.==============" + String(calAdd6(8,21)))
        print("\n")
        
        
        
        //尾随闭包
        //若将闭包作为函数最后一个参数，可以省略参数标签,然后将闭包表达式写在函数调用括号后面
        
        func testFunction(testBlock:()->Void){
            testBlock()
        }
        
        testFunction(testBlock: {
            print("11.==============正常写法")
            print("\n")
        })
        
        testFunction(){
            print("12.==============尾随闭包写法")
            print("\n")
        }
        
        testFunction { 
            print("13.==============去掉括号的尾随闭包写法")
            print("\n")
        }
        
        
        func testFunction2(str:String,testBlock: () -> Void){
            testBlock()
        }
        
        testFunction2(str: "【2】",testBlock: {
            print("14.==============正常写法")
            print("\n")
        })
        
        testFunction2(str: "【2】"){
            print("15.==============尾随闭包写法")
            print("\n")
        }
        
        
        //值捕获
        //闭包可以在其被定义的上下文中捕获常量或变量。Swift中，可以捕获值的闭包的最简单形式是嵌套函数，也就是定义在其他函数的函数体内的函数。
        //不理解 看👆的网址
//        func captureValue(sums amount:Int)->()->Int{
//            
//        }
        
        
        
        //逃逸闭包
        //当一个闭包作为参数传到一个函数中，需要这个闭包在函数返回之后才被执行，我们就称该闭包从函数种逃逸。一般如果闭包在函数体内涉及到异步操作，但函数却是很快就会执行完毕并返回的，闭包必须要逃逸掉，以便异步操作的回调。
        //逃逸闭包一般用于异步函数的回调，比如网络请求成功的回调和失败的回调。语法：在函数的闭包行参前加关键字“@escaping”。
        
        func doSomething(some: @escaping()->Void){
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                some()
            }
            print("21.==============函数体")
            print("\n")
        }
        
        doSomething {
            print("22.==============逃逸闭包")
            print("\n")
        }
        
        
        var completionHandle:()->String = {"约吗?"}
        func doSomething2(some: @escaping ()->String){
            completionHandle = some
        }
        
        doSomething2 { () -> String in
            return "ss 不约"
        }
        
        print("23.==============" + completionHandle())
        print("\n")
        
        
        
        //自动闭包
        
        //顾名思义，自动闭包是一种自动创建的闭包，封装一堆表达式在自动闭包中，然后将自动闭包作为参数传给函数。而自动闭包是不接受任何参数的，但可以返回自动闭包中表达式产生的值。
        //自动闭包让你能够延迟求值，直到调用这个闭包，闭包代码块才会被执行。说白了，就是语法简洁了，有点懒加载的意思
        
        
        var array = ["I","have","a","apple"]
        print("31.==============" + String(describing: array))
        print("\n")
        
        let removeBlock = {array.remove(at: 3)}//定义不执行
        print("32.==============" + String(describing: array))
        print("\n")
        
        let result = removeBlock()
        print("33.==============" + String(describing: result))
        print("33_1.==============" + String(describing: array))
        print("\n")
        
        
        
        //解决闭包循环   http://www.cocoachina.com/ios/20170206/18629.html
        //1.weak var weakShop = shop方式解决循环引用，在平时开发中我们不用这个方法，用起来很麻烦
        let shop1 : YHShop = YHShop()
        weak var weakSkop = shop1
        shop1.myBlock1 = {str in
            weakSkop?.content = str
        }
        shop1.myBlock1("莫西莫西")
        
        print("41.==============" + shop1.content)
        print("\n")
        
        
        //[unowned shop]方式解决循环引用，在平时开发中我们不用这个方法，这个方法是很危险的！
        let shop2 : YHShop = YHShop()
        shop2.myBlock2 = {[unowned shop2]str in
            shop2.content = str
        }
        
        shop2.myBlock2("莫西莫西2")
        
        print("42.==============" + shop2.content)
        print("\n")
        
        
        //[weak self]方式解决循环引用，在平时开发中我们经常用这个方法，这个方式只是一种简便的写法！
        
        let shop3  : YHShop = YHShop()
        shop3.myBlock1 = {[weak shop3] str in
            shop3?.content = str
        }
        shop3.myBlock1("莫西莫西3")
        print("43.==============" + shop3.content)
        print("\n")
        
        
        //没有dealloc
        let shop4  : YHShop = YHShop()
        shop4.myBlock1 = {str in
            shop4.content = str
        }
        shop4.myBlock1("莫西莫西4")
        print("44.==============" + shop4.content)
        print("\n")
        
        
        
//        let shop5  : YHShop = YHShop()
//        shop5.myBlock1 = {[weak shop5] str in
//            DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: { 
//              shop5?.content = str
//            })
//        }
//        shop5.myBlock1("莫西莫西5")
//        print("45.==============" + shop5.content)
//        print("\n")
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



class YHShop {
    
    var content : String = ""
    
    typealias ShopBlock = (String)->Void
    var myBlock1 : ShopBlock = {str in}
    var myBlock2 : (String)->Void = {str in}
    
    //deinit相当OC中的dealloc方法:
    deinit {
        print("dealloc shop")
    }
}
