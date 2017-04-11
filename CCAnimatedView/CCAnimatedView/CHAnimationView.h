//
//  CHAnimationView.h
//  CCAnimatedView
//
//  Created by ccSunday on 2017/4/11.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHAnimationView : UIButton

@property (nonatomic,copy)void(^animationFinished)();

+ (instancetype)beanView;

/**
 默认动画

 @return return value description
 */
- (CHAnimationView *)defaultAnimationWithNum:(NSInteger)beanNum;

@end
