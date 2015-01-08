//
//  CYCircle.m
//  CYCircleScale
//
//  Created by ishang on 14/12/9.
//  Copyright (c) 2014年 commondec. All rights reserved.
//

#import "CYCircle.h"

@implementation CYCircle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        self.animationLayer = [CALayer layer];
        self.animationLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self.layer addSublayer:self.animationLayer];
        
        [self drawyuan:frame];
        //[self startAnimation];
        _countlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [_countlabel setBackgroundColor:[UIColor clearColor]];
        _countlabel.textAlignment = NSTextAlignmentCenter;
        //_countlabel.center = self.center;
        [self addSubview:_countlabel];
       // _countlabel.center = self.center;
    }
    return self;
}

-(void)drawyuan:(CGRect)rect{
    
    CGRect pathRect = CGRectInset(self.layer.bounds, 0, 0);
            UIBezierPath * path = [UIBezierPath bezierPath];
    
    [path addArcWithCenter:CGPointMake(rect.size.width/2, rect.size.height/2) radius:rect.size.width / 2 startAngle:-M_PI_2 endAngle:3*M_2_PI+M_PI clockwise:YES];
    
    
        CAShapeLayer * pathLayer = [CAShapeLayer layer];
        pathLayer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
        pathLayer.bounds = pathRect;
        //pathLayer.geometryFlipped = YES;
        pathLayer.path = path.CGPath;
        pathLayer.strokeColor = [UIColor greenColor].CGColor;
        pathLayer.fillColor = nil;
        pathLayer.lineWidth = 50.0f;
        pathLayer.lineJoin = kCALineJoinBevel;
        [self.animationLayer addSublayer:pathLayer];
        self.pathLayer = pathLayer;
        [self.animationLayer addSublayer:self.pathLayer];
}
- (void) startAnimation
{
        [self.pathLayer removeAllAnimations];
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        pathAnimation.duration = 10.0;
    
        pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
        pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
        [self.pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
    
        CABasicAnimation *pathAnimations = [CABasicAnimation animationWithKeyPath:@"strokeColor"];
        pathAnimations.duration = 5.0;
        pathAnimations.beginTime = 0.0;
        pathAnimations.fromValue = (__bridge id)([UIColor greenColor].CGColor);
        pathAnimations.toValue = (__bridge id)([UIColor yellowColor].CGColor);
    
    
        CABasicAnimation *pathAnimationss = [CABasicAnimation animationWithKeyPath:@"strokeColor"];
        pathAnimationss.duration = 5.0;
        pathAnimationss.beginTime = 5.0;
        pathAnimationss.fromValue = (__bridge id)([UIColor yellowColor].CGColor);
        pathAnimationss.toValue = (__bridge id)([UIColor redColor].CGColor);
    
    
        CAAnimationGroup *group = [CAAnimationGroup animation];
        group.animations = [NSArray arrayWithObjects:pathAnimations,pathAnimationss , nil];
        group.duration = 10.0;
        [self.pathLayer addAnimation:group forKey:nil];
        self.pathLayer.speed = 0.0;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
