//
//  MTACoreDataManager.swift
//  MenuTiny
//
//  Created by caihongguang on 2018/5/22.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import UIKit
import CoreData

//open则是弥补public语义上的不足。这个元素可以在其他作用域被访问
//这个元素可以在其他作用域被继承或者override
open class MTACoreDataManager: NSObject {

    open static let sharedInstance = MTACoreDataManager()
    
    /// 被管理的对象上下文 -> 对数据进行增 删 改 查
//    lazy var managedObjectContext: NSManagedObjectContext = {
//        let coordinator = self.persist
//
//    }
    
    
    
}
