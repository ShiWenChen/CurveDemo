//
//  UIBezierPath+MyBezier.m
//  心跳曲线
//
//  Created by admin on 2016/10/17.
//  Copyright © 2016年 racer. All rights reserved.
//

#import "UIBezierPath+MyBezier.h"
#import "myPoint.h"

@implementation UIBezierPath (MyBezier)
+ (UIBezierPath *)quadCurvedPathWithPoints:(NSArray *)points
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    myPoint *point = points[0];
    CGPoint p1 = CGPointMake(point.x, point.y);
    [path moveToPoint:p1];
    
    if (points.count == 2) {
        point = points[1];
        CGPoint p2 = CGPointMake(point.x, point.y);
        [path addLineToPoint:p2];
        return path;
    }
    
    for (NSUInteger i = 1; i < points.count; i++) {
        point = points[i];
        CGPoint p2 = CGPointMake(point.x, point.y);
        
        CGPoint midPoint = midPointForPoints(p1, p2);
        [path addQuadCurveToPoint:midPoint controlPoint:controlPointForPoints(midPoint, p1)];
        [path addQuadCurveToPoint:p2 controlPoint:controlPointForPoints(midPoint, p2)];
        
        p1 = p2;
    }
    return path;
}
static CGPoint midPointForPoints(CGPoint p1, CGPoint p2) {
    return CGPointMake((p1.x + p2.x) / 2, (p1.y + p2.y) / 2);
}

static CGPoint controlPointForPoints(CGPoint p1, CGPoint p2) {
    CGPoint controlPoint = midPointForPoints(p1, p2);
    CGFloat diffY = abs((int)p2.y - (int)controlPoint.y);
    
    if (p1.y < p2.y)
        controlPoint.y += diffY;
    else if (p1.y > p2.y)
        controlPoint.y -= diffY;
    
    return controlPoint;
}
@end
