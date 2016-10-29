//
//  Person.swift
//  WSCoderObject
//
//  Created by OneZens on 16/1/25.
//  Copyright © 2016年 www.onezen.cc. All rights reserved.
//

import UIKit

class Person: WSCoderObject {

    var name: String?
    
    var age: Int = 0
    
    var icon: UIImage?
    
    var birth: Date?
    
    //重写description
    override var description: String {
        
        let keys = ["name", "age", "icon", "birth"]
        
        return dictionaryWithValues(forKeys: keys).description
    }
    
    /// 重写init方法
    override init() {
        super.init()
    }
    /// 重写解档方法
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
