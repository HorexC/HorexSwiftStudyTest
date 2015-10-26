//
//  Mobile.h
//  swiftTest
//
//  Created by Horex on 15/10/26.
//  Copyright © 2015年 Horex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mobile : NSObject

@property (nonatomic, strong) NSString *brand;

@property (nonatomic, strong) NSString *system;

- (instancetype)initWithBrand:(NSString *)brand system:(NSString *)system;

@end
