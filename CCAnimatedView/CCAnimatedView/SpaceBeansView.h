//
//  SpaceBeansView.h
//  CCAnimatedView
//
//  Created by ccSunday on 2017/4/11.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpaceBeansView : UIButton

@property (nonatomic,copy)void(^animationFinished)();

+ (instancetype)beanView;

/**
 默认动画

 @return return value description
 */
- (SpaceBeansView *)defaultAnimationWithNum:(NSInteger)beanNum;

///**
// 自定义动画时间
//
// @param beanNum beanNum description
// @param ptime ptime description
// @param dtime distime description
// @return return value description
// */
//- (SpaceBeansView *)animationWithNum:(NSInteger)beanNum
//                            popTime:(NSTimeInterval)ptime
//                            dismissTime:(NSTimeInterval)dtime;
@end
