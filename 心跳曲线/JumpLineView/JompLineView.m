//
//  JompLineView.m
//  心跳曲线
//
//  Created by admin on 2016/10/14.
//  Copyright © 2016年 racer. All rights reserved.
//

#import "JompLineView.h"
#import "myPoint.h"
#import "UIBezierPath+MyBezier.h"

/**
 X轴距

 */
#define X_TIME 37.5
@interface JompLineView()
{
    int x;
    int y;
    
}
@property (nonatomic,strong)NSMutableArray *pointsArray;
@end

@implementation JompLineView

-(void)drawRect:(CGRect)rect{
    [self.pointsArray addObject:[self getPoints]];
    if (self.pointsArray.count >= 10) {
        for (myPoint *point in self.self.pointsArray) {
            
             point.x -= X_TIME;
        }
    }

    UIBezierPath *path = [UIBezierPath quadCurvedPathWithPoints:self.pointsArray];
    [[UIColor redColor] setStroke];
    [[UIColor redColor] setFill];
    path.lineWidth = 1.5f;
    [path stroke];
    
}
-(myPoint *)getPoints{
    ///JompLineView宽度
    if (x < 375) {
        x += X_TIME;
        
    }
    ///JompLineView高度
    if (y<160) {
        y += arc4random() % 80;
    }else{
        y -= arc4random() % 80;
    }
    
    
    myPoint *point = [[myPoint alloc] init];
    point.x = x;
    point.y = y;
    if (self.pointsArray.count > 10) {
        [self.pointsArray removeObjectAtIndex:0];
        
    }
    return point;
    
}


-(NSMutableArray *)pointsArray{
    if (!_pointsArray) {
        _pointsArray = [[NSMutableArray alloc] init];
    }
    return _pointsArray;
}
@end
