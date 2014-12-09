//
//  ViewController.m
//  CYCircleScale
//
//  Created by ishang on 14/11/19.
//  Copyright (c) 2014年 commondec. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 220, self.view.frame.size.width-100,50)];
    [self.view addSubview:_slider];
    [_slider setMinimumValue:0.f];
    [_slider setMaximumValue:100.f];
    _label = [[UILabel alloc] initWithFrame:CGRectMake(50, 230, self.view.frame.size.width-100,50)];
    [self.view addSubview:_label];
    
   [_slider addTarget:self action:@selector(updateValue:) forControlEvents:UIControlEventValueChanged];
    
    _circle = [[CYCircle alloc] initWithFrame:CGRectMake(110, 60, 100, 100)];
    [self.view addSubview:_circle];
     [_circle startAnimation];
    
}

-(void)updateValue:(id)sender {
    UISlider * slider = (UISlider *)sender;
    _circle.pathLayer.timeOffset = slider.value/10;
    _circle.countlabel.text = [NSString stringWithFormat:@"%.0f",slider.value];
    [_label setText:[NSString stringWithFormat:@"%.0f",slider.value]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
