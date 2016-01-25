# WSCoderObject-Swift
WSCoderObject-Swift，Swift一键归档工具类,NSCoding

Object-C 版归档工具类： [https://github.com/wackosix/WSCoderObject-OC](https://github.com/wackosix/WSCoderObject-OC)

# 用法(Usage)
1. 将 WSCoderObject.swift 文件导入你的项目
2. 把你需要归档的类文件，继承于 WSCoderObject
3. 通过 `NSKeyedArchiver.archiveRootObject(rootObject: AnyObject, toFile: String)` 来归档你需要保存的类; `NSKeyedUnarchiver.unarchiveObjectWithFile(path: String)` 方法来解档保存在本地的类。

#Demo
你的类只需要继承于：WSCoderObject

```
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

```

自动实现归档、解档

```
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

```



