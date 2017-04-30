//
//  Book.swift
//  DouBan
//
//  Created by 林宁宁 on 2017/4/27.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

import UIKit

class Book: NSObject {

    var id = ""
    var isbn10 = "" //老的10位图书编码
    var isbn13 = "" //新标准的13位编码
    var title = ""
    var origin_title = ""
    var alt_title = ""
    var subtitle = ""
    var url = "" //json格式，图书详细信息
    var alt = "" //html格式，图书详细信息
    var image = ""
    var images = [String:String]() //key:small、large、medium 对应三种质量的封面图
    var author = [String]()  //作者姓名
    var translator = [String]() //译者姓名
    var publisher = "" //出版社
    var pubdate = ""
    var rating = Rating()//图书评分信息
    var tags = [[String:AnyObject]]() // 标签列表,key:count、name
    var binding = ""  //平装 精装
    var price = ""
    var series = [String:String]() //key：id、title
    var pages = "" //总页数
    var author_intro = ""
    var summary = "" //摘要
    var catalog = "" //序言
    var ebook_url = ""  //该字段只在存在对应电子书时提供
    var ebook_price = ""
    
    
    init(dict: [String: AnyObject]) {
        
        id = dict["id"] as? String ?? ""
        isbn10 = dict["isbn10"] as? String ?? ""
        isbn13 = dict["isbn13"] as? String ?? ""
        title = dict["title"] as? String ?? ""
        origin_title = dict["origin_title"] as? String ?? ""
        alt_title = dict["alt_title"] as? String ?? ""
        subtitle = dict["subtitle"] as? String ?? ""
        url = dict["url"] as? String ?? ""
        alt = dict["alt"] as? String ?? ""
        image = dict["image"] as? String ?? ""
        author = dict["author"] as? [String] ?? []
        translator = dict["translator"] as? [String] ?? []
        publisher = dict["publisher"] as? String ?? ""
        pubdate = dict["pubdate"] as? String ?? ""
        binding = dict["binding"] as? String ?? ""
        price = dict["price"] as? String ?? ""
        pages = dict["pages"] as? String ?? ""
        author_intro = dict["author_intro"] as? String ?? ""
        summary = dict["summary"] as? String ?? ""
        catalog = dict["catalog"] as? String ?? ""
        ebook_url = dict["ebook_url"] as? String ?? ""
        ebook_price = dict["ebook_price"] as? String ?? ""
        
        images = dict["images"] as? [String:String] ?? [:]
        tags = dict["tags"] as? [[String:AnyObject]] ?? [[:]]
        series = dict["series"] as? [String:String] ?? [:]
        
        if let ratingDic = dict["rating"] as? [String:AnyObject]{
            rating = Rating(dict:ratingDic)
        }
    }
}
