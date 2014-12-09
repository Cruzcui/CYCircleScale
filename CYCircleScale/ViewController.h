//
//  ViewController.h
//  CYCircleScale
//
//  Created by ishang on 14/11/19.
//  Copyright (c) 2014年 commondec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYCircle.h"
@interface ViewController : UIViewController
@property (nonatomic,strong)UISlider * slider;
@property (nonatomic, strong)UILabel * label;
@property (nonatomic, strong) CYCircle * circle;
@end

