//
//  ViewController.m
//  CCAnimatedView
//
//  Created by ccSunday on 2017/4/10.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "ViewController.h"

#import "SpaceBeansView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)restartAnimation:(UIButton *)sender {
    SpaceBeansView *beanView = [[SpaceBeansView beanView]defaultAnimationWithNum:2];
    beanView.animationFinished = ^{
        NSLog(@"animation finished!");
    };
}
@end
