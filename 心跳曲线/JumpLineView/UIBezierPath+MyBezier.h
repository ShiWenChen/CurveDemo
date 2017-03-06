//
//  UIBezierPath+MyBezier.h
//  心跳曲线
//
//  Created by admin on 2016/10/17.
//  Copyright © 2016年 racer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (MyBezier)
+ (UIBezierPath *)quadCurvedPathWithPoints:(NSArray *)points;
@end
