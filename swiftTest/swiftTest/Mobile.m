//
//  Mobile.m
//  swiftTest
//
//  Created by Horex on 15/10/26.
//  Copyright © 2015年 Horex. All rights reserved.
//

#import "Mobile.h"

@implementation Mobile

- (instancetype)initWithBrand:(NSString *)brand system:(NSString *)system {
    
    self = [super init];
    
    if (self) {
        
        _brand = brand;
        
        _system = system;
        
    }
    
    return self;
    
}

@end
