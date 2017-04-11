//
//  CHAnimationView.m
//  CCAnimatedView
//
//  Created by ccSunday on 2017/4/11.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "CHAnimationView.h"

#import "CHAnimation.h"

#import "AppDelegate.h"

#import "UIView+frame.h"
#import "UIColor+expanded.h"

//获取当前的显示的vc
#define CurrentRootVC        [(AppDelegate *)[UIApplication sharedApplication].delegate window].rootViewController;

#define K_DefaultPopTime  0.6

#define K_DefaultDismissTime 0.8

#define K_DefaultDelayTime  0.2

#define K_DefaultMoveLength   280

#define K_ViewWidth     100

#define WIDTH  ([[UIScreen mainScreen]bounds].size.width)

#define HEIGHT ([[UIScreen mainScreen]bounds].size.height)

#define GREEN_COLOR   [UIColor colorWithHexString:@"#00c9b2"]

#define YELLOW_COLOR [UIColor colorWithHexString:@"#ffad2d"]


@implementation CHAnimationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)beanView{
    return [[self alloc]init];
}

- (id)init{
    
    if ((self = [CHAnimationView buttonWithType:UIButtonTypeCustom])) {
        [self config];
    }
    return self;
}

- (void)config{
    self.size = CGSizeMake(K_ViewWidth, K_ViewWidth);
    self.alpha = 0;
    self.layer.cornerRadius = self.height/2;
    self.backgroundColor = YELLOW_COLOR;
    self.userInteractionEnabled = NO;
    self.titleLabel.font = [UIFont systemFontOfSize:18];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIViewController *vc = CurrentRootVC;
    self.centerX = vc.view.centerX;
    self.centerY = vc.view.centerY;
    self.hidden = YES;
    [self setImage:[UIImage imageNamed:@"bean"] forState:UIControlStateNormal];
    [vc.view addSubview:self];
}

/**
 默认动画
 
 @return return value description
 */
- (CHAnimationView *)defaultAnimationWithNum:(NSInteger)beanNum{
    self.hidden = NO;
    [self ch_removeAllAnimations];
    [self setTitle:[NSString stringWithFormat:@"+ %ld",(long)beanNum] forState:UIControlStateNormal];
   
    CHAnimation *popAlpha = [CHAnimation new];
    popAlpha.beginTime = CACurrentMediaTime();
    popAlpha.fromValue = @0.0;
    popAlpha.toValue = @1;
    popAlpha.duration = K_DefaultPopTime;
    popAlpha.writeBlock = ^(id obj, id value) {
        self.alpha = [value floatValue];
    };
    [self ch_addAnimation:popAlpha forKey:@"popAlpha"];

    CHAnimation *enlarge = [CHAnimation new];
    enlarge.beginTime = CACurrentMediaTime();
    enlarge.fromValue = @(self.height/4);
    enlarge.toValue = @(self.height/2);
    enlarge.duration = K_DefaultPopTime;
    enlarge.writeBlock = ^(id obj, id value) {
        self.centerX = WIDTH/2;
        self.centerY = HEIGHT/2;
        CGFloat fvalue = [value floatValue];
        self.size = CGSizeMake(2*fvalue, 2*fvalue);
        self.layer.cornerRadius = fvalue;
    };
    [self ch_addAnimation:enlarge forKey:@"enlarge"];
    
    CHAnimation *move = [CHAnimation new];
    move.beginTime = CACurrentMediaTime()+K_DefaultPopTime+K_DefaultDelayTime;
    move.duration = K_DefaultDismissTime;
    move.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.centerX,self.centerY)];
    move.toValue = [NSValue valueWithCGPoint:CGPointMake(self.centerX, self.centerY-K_DefaultMoveLength)];
    move.writeBlock = ^(id obj, id value) {
        
        self.center = [value CGPointValue];
    };
    [self ch_addAnimation:move forKey:@"move"];
    
    CHAnimation *dismissAlpha = [CHAnimation new];
    dismissAlpha.beginTime = CACurrentMediaTime()+K_DefaultPopTime+K_DefaultDelayTime;
    dismissAlpha.fromValue = @1.0;
    dismissAlpha.toValue = @0.0;
    dismissAlpha.duration = K_DefaultDismissTime;
    
    
    
    dismissAlpha.writeBlock = ^(id obj, id value) {
        self.alpha = [value floatValue];
        
        
        if (self.alpha == 0) {
            if (self.animationFinished) {
                self.animationFinished();
            }
            [self removeFromSuperview];
        }
    };
    
    [self ch_addAnimation:dismissAlpha forKey:@"dismissAplha"];
    
    return self;
    
}

@end
