//
//  ViewController.m
//  心跳曲线
//
//  Created by admin on 2016/10/14.
//  Copyright © 2016年 racer. All rights reserved.
//

#import "ViewController.h"
#import "JompLineView.h"

@interface ViewController ()
@property (nonatomic,weak)IBOutlet JompLineView *jompLineView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self.jompLineView setNeedsDisplay];
    }];
    
}



@end
