//
//  Person.swift
//  WSCoderObject
//
//  Created by WackoSix on 16/1/25.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

import UIKit

class Person: WSCoderObject {

    var name: String?
    
    var age: Int = 0
    
    var icon: UIImage?
    
    var birth: NSDate?
    
    //重写description
    
    override var description: String {
        
        let keys = ["name", "age", "icon", "birth"]
        
        return dictionaryWithValuesForKeys(keys).description
    }
}
