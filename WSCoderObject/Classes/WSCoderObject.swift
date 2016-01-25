//
//  WSCoderObject.swift
//  WSCoderObject
//
//  Created by WackoSix on 16/1/25.
//  Copyright © 2016年 www.wackosix.cn. All rights reserved.
//

import UIKit

class WSCoderObject: NSObject, NSCoding {
 
    //归档
    func encodeWithCoder(aCoder: NSCoder) {
        
        var count: UInt32 = 0
        
        let ivars = class_copyIvarList(self.classForCoder, &count)
        
        for i in 0..<count {
            
            let ivar = ivars[Int(i)]
            let name = String(CString: ivar_getName(ivar), encoding: NSUTF8StringEncoding)!
            aCoder.encodeObject(valueForKey(name), forKey: name)
        }
        
        free(ivars)
        
    }
    
    //解档
    required init?(coder aDecoder: NSCoder) {
     
        super.init()
        
        var count: UInt32 = 0
        
        let ivars = class_copyIvarList(self.classForCoder, &count)
        
        for i in 0..<count {
            
            let ivar = ivars[Int(i)]
            let name = String(CString: ivar_getName(ivar), encoding: NSUTF8StringEncoding)!
            setValue(aDecoder.decodeObjectForKey(name), forKey: name)
        }
        
        free(ivars)
    }
    
    override init() {
        super.init()
    }

}
