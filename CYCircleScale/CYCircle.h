//
//  CYCircle.h
//  CYCircleScale
//
//  Created by ishang on 14/12/9.
//  Copyright (c) 2014年 commondec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYCircle : UIView
@property (nonatomic, strong) CALayer *animationLayer;
@property (nonatomic, strong) CAShapeLayer *pathLayer;
@property (nonatomic, strong) UILabel * countlabel;
@property (nonatomic, assign) CGFloat speed;
- (void) startAnimation;
@end
