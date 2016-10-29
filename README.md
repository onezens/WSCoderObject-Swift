# WSCoderObject-Swift
WSCoderObject-Swift，Swift一键归档工具类,NSCoding

Object-C 版归档工具类： [https://github.com/wackosix/WSCoderObject-OC](https://github.com/wackosix/WSCoderObject-OC)

# 版本
* 2016.10.29 更新到swift 3.0

# 用法(Usage)
1. 将 WSCoderObject.swift 文件导入你的项目
2. 把你需要归档的类文件，继承于 WSCoderObject
3. 通过 `NSKeyedArchiver.archiveRootObject(rootObject: AnyObject, toFile: String)` 来归档你需要保存的类; `NSKeyedUnarchiver.unarchiveObjectWithFile(path: String)` 方法来解档保存在本地的类。
4. 如果你的类重写了init方法，或者init方法的重载，那么你的子类必须要实现下面这个方法，否则会报错

```
 required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
```

#Demo
你的类只需要继承于：WSCoderObject

```
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
	}
	
    /// 重写init方法
    override init() {
        super.init()
    }
    /// 重写解档方法
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


```

自动实现归档、解档

```
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


```



