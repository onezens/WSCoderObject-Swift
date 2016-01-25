//
//  ViewController.swift
//  WSCoderObject
//
//  Created by WackoSix on 16/1/25.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let xiaoming = Person()
        
        xiaoming.name = "xiaoming"
        xiaoming.age = 18
        xiaoming.birth = NSDate()
        xiaoming.icon = UIImage(named: "")
        
        var path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).first!
        path = path.stringByAppendingString("/person.data")
        
        //归档
        NSKeyedArchiver.archiveRootObject(xiaoming, toFile: path)
        
        //解档
        let obj = NSKeyedUnarchiver.unarchiveObjectWithFile(path)
        print(obj)
    }


}

