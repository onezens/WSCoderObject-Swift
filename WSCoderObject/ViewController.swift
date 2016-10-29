//
//  ViewController.swift
//  WSCoderObject
//
//  Created by OneZens on 16/1/25.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let xiaoming = Person()
        
        xiaoming.name = "xiaoming"
        xiaoming.age = 18
        xiaoming.birth = Date()
        xiaoming.icon = UIImage()
        
        var path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first!
        path = path + "/person.data"
        
        //归档
        NSKeyedArchiver.archiveRootObject(xiaoming, toFile: path)
        
        //解档
        let obj = NSKeyedUnarchiver.unarchiveObject(withFile: path)
        print(obj)
    }


}

