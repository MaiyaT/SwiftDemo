//
//  HomeViewController.swift
//  DouBan
//
//  Created by 林宁宁 on 2017/4/27.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit


class HomeViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var tableV:UITableView!
    var list = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "首页"
        
        tableV = UITableView(frame: self.view.bounds, style: .plain)
        tableV.delegate = self
        tableV.dataSource = self
        tableV.rowHeight = 50
        tableV.register(Home_Cell.self, forCellReuseIdentifier: Home_Cell.cell_identify())
        tableV.tableFooterView = UIView()
        self.view.addSubview(tableV)
        
        list = [
            
            ["title":"定时器","vc":"TimeViewController"],
            ["title":"字体变换","vc":"FontViewController"],
            ["title":"UserDefault","vc":"UserDefaultViewController"],
            ["title":"GCD","vc":"GCDViewController"],
            ["title":"enum class struct","vc":"ClassEnumStruceViewController"],
            ["title":"Protocol","vc":"ProtocolViewController"],
            ["title":"Delegate","vc":"DelegateViewController"],
            ["title":"单例","vc":"SingletonViewController"],
            ["title":"Block","vc":"BlockViewController"]
        ]
        
        
        
        
//        let rawStudent = "[{\"name\":\"Ray\", \"grade\":\"5.0\"}, {\"name\":\"Matt\", \"grade\":\"6\"},{\"name\":\"Chris\", \"grade\":\"6.33\"}, {\"name\":\"Cosmin\", \"grade\":\"7\"},{\"name\":\"Steven\", \"grade\":\"7.5\"}]"
//        let data = rawStudent.data(using: .utf8)!
//        let students = makeStudent(with: data)
//        
//        dump(students)
        
//        let foo : String? = " "
//        foo.isb
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Home_Cell.cell_identify())
        
        let dic = list.reversed()[indexPath.row] as? [String:AnyObject] ?? [:]
        
        cell?.textLabel?.text = dic["title"] as? String
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let dic = list.reversed()[indexPath.row] as? [String:AnyObject] ?? [:]
        let vc_str = dic["vc"] as? String
        let vc_title = dic["title"] as? String
        
        guard let _ = vc_str else {
            return
        }
        
        let vc_class = NSClassFromString(getAPPName()+"."+vc_str!) as? UIViewController.Type
        
        let vc = vc_class?.init()
        vc?.title = vc_title!
        
        self.navigationController?.pushViewController(vc!, animated: true)
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






class Home_Cell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        self.accessoryType = .disclosureIndicator
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //定义类方法
    class func cell_identify ()-> String {
        return "HomeCellIdentify"
    }
    
}
