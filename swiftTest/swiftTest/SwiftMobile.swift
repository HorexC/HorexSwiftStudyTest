//
//  SwiftMobile.swift
//  swiftTest
//
//  Created by Horex on 15/10/26.
//  Copyright © 2015年 Horex. All rights reserved.
//

import Foundation



struct SwiftMobile {
    
    let brand: String
    
    let system: String
    
}

extension SwiftMobile: _ObjectiveCBridgeable {
    typealias _ObjectiveCType = Mobile
    
    /**     判断是否能转换成Objective-C 对象     */
    static func _isBridgedToObjectiveC() -> Bool {
        return true
    }
    
    /**     获取转换目标类型     */
    static func _getObjectiveCType() -> Any.Type {
        return _ObjectiveCType.self
    }

    /**     转换成Objective-C 对象     */
    func _bridgeToObjectiveC() -> _ObjectiveCType {
        return Mobile(brand: brand, system: system)
    }
    
    // 强制将Objective-C对象转换成Swift结构体类型
    static func _forceBridgeFromObjectiveC(source: SwiftMobile._ObjectiveCType, inout result: SwiftMobile?) {
        result = SwiftMobile(brand: source.brand, system: source.system)
    }
    
    // 有条件地将Objective-C对象转换成Swift结构体类型
    static func _conditionallyBridgeFromObjectiveC(source: SwiftMobile._ObjectiveCType, inout result: SwiftMobile?) -> Bool {
        _forceBridgeFromObjectiveC(source, result: &result)
        return true
    }
}