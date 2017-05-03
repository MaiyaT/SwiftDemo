//
//  TraverseViewController.swift
//  YHSwiftDemo
//
//  Created by 林宁宁 on 2017/5/3.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit

//http://www.jianshu.com/p/9fae1a4746bb

class TraverseViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK : 第一种方式：for-in循环
        //遍历数组
        let iosArray = ["00","01", "02", "03", "04", "05", "06", "07"]
        //遍历字典
        let iosDict = ["1": "one", "2": "two", "3": "three", "4": "four"]
        
        for index in 0...6{
            print("1.===============" + iosArray[index] + "\n")
        }
        
        for index in 0..<6{
            print("2.===============" + iosArray[index] + "\n")
        }
        
        for ele in iosArray{
            print("3.===============" + ele + "\n")
        }
     
        for (key,value) in iosDict{
            print("4.===============" + "key=" + key + " " + "value=" + value + "\n")
        }
        
        //单独遍历字典的key和value
        for k in iosDict.keys{
            print("5.===============" + "key=" + k + "\n")
        }
        
        for v in iosDict.values{
            print("6.===============" + "value=" + v + "\n")
        }
        
        //拓展1：0...6的形式还可以取出制定范围的数组中的元素
        let sectionArray = iosArray[1...4]
        print("7.===============\(sectionArray)" + "\n")
        
        //拓展2：0...6的形式还可以用来初始化创建数组
        let sectionArray1 = Array(1...7)
        print("8.===============\(sectionArray1)" + "\n")
        
        
        
        
        // MARK : 第二种方式：Swift为for循环带来的惊喜
        // 反向遍历
        for index in (0...6).reversed(){
            print("10.===============\(iosArray[index])" + "\n")
        }
        
        for ele in iosArray.reversed(){
            print("11.===============\(ele)" + "\n")
        }
        
        for (key,value) in iosDict.reversed(){
            print("12.===============" + "key=" + key + " " + "value=" + value + "\n")
        }
        
        //看过我去年总结的OC循环遍历的小伙伴一定还记得，当我们需要在遍历集合时改变集合中的元素时，正向遍历会偶尔出现崩溃的问题，尤其是数据量较大时几乎每次都会崩溃，当我们使用反向遍历时就没有崩溃的问题了，在Swift中为了保证程序的稳定，也建议在遍历集合需要修改集合元素时采用反向遍历
        //reversed()函数实际上是返回给我们一个顺序完全颠倒的集合，那么我们就可以利用这个函数得到一个倒序的集合，非常方便，
        
        
        // MARK: forEach遍历
        //1、不能使用“break”或者“continue”退出遍历；
        //2、使用“return”结束当前循环遍历，这种方式只是结束了当前闭包内的循环遍历，并不会跳过后续代码的调用。
        iosArray.forEach { (str) in
            print("21.===============\(str)" + "\n")
        }
        
        iosArray.reversed().forEach { (str) in
            if str == "E"{
                return
            }
            print("22.===============\(str)" + "\n")
        }
        
        
        // MARK: stride 遍历 跨越
        
        for index in stride(from: 1, to: 4, by: 1){
            //遍历了 index = 1,2,3
            print("30.===============\(iosArray[index])" + "\n")
        }
        for index in stride(from: 1, through: 4, by: 1){
            //遍历了 index = 1,2,3,4
            print("31.===============\(iosArray[index])" + "\n")
        }
        for index in stride(from: 0, through: 14, by: 2){
            //遍历了 index = 0,2,4,6   by表示跳跃 间隔多少个遍历
            if index < iosArray.count - 1{
                print("32.===============\(iosArray[index])" + "\n")
            }
        }
        for index in stride(from: 6, through: 1, by: -1){
            //遍历了 index = 6,5,4,3,2,1    倒叙
            print("33.===============\(iosArray[index])" + "\n")
        }
        
        
        // MARK: 基于块的遍历
        //1、(n, c)中n表示元素的输入顺序，c表示集合中的每一个元素；
        //2、由于数组是有序的，所以在数组中n自然也可以表示每一个元素在数组中索引，而字典是无序的，但是n依然会按照0、1、2...的顺序输入，因此不可以代表在字典中的索引。
        for (index,value) in iosArray.enumerated(){
            print("34.===============" + "index_\(index)" + "  " + "value_\(value)" + "\n")
        }
        
        for (index,value) in iosDict.enumerated(){
            print("35.===============" + "index_\(index)" + "  " + "value_\(value)" + "\n")
        }
        
        for (index,value) in iosArray.enumerated().reversed(){
            print("36.===============" + "index_\(index)" + "  " + "value_\(value)" + "\n")
        }
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
