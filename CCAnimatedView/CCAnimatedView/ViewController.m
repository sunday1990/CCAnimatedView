//
//  ViewController.m
//  CCAnimatedView
//
//  Created by ccSunday on 2017/4/10.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "ViewController.h"

#import "CHAnimationView.h"


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
 
    [[CHAnimationView beanView]defaultAnimationWithNum:2].animationFinished = ^{
        NSLog(@"animation finished!");
    };
}
@end
