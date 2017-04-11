//
//  FuncTool.h
//  CCAnimatedView
//
//  Created by ccSunday on 2017/4/11.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FuncTool : NSObject

+ (instancetype)func;

- (void)funcWithFromValue:(id)fromValue
                  toValue:(id)toValue
                 duration:(CFTimeInterval)duration;

@end
