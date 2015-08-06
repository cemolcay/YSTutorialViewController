//
//  YSTutorialViewControllerCloseButton.m
//  YSTutorialViewController
//
//  Created by Cem Olcay on 11/06/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

#import "YSTutorialViewControllerCloseButton.h"

#define RightPad 20

@implementation YSTutorialViewControllerCloseButton

#pragma mark - Init

- (instancetype)initWithColor:(UIColor *)color lineWidth:(CGFloat)lineWidth size:(CGSize)size action:(YSTutorialViewControllerCloseButtonAction)action {
    
    if ((self = [super init])) {
        
        self.color = color;
        self.lineWidth = lineWidth;
        self.action = action;
        self.size = size;
        
        self.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - RightPad - self.size.width,
                                40,
                                self.size.width,
                                self.size.height);
        
        [self addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self draw];
    }
    return self;
}


#pragma mark - Draw

- (void)draw {
    
    if (self.closeShapeLayer != nil) {
        [self.closeShapeLayer removeFromSuperlayer];
        self.closeShapeLayer = nil;
    }
    
    self.closeShapeLayer = [[CAShapeLayer alloc] init];
    self.closeShapeLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.closeShapeLayer.lineWidth = self.lineWidth;
    self.closeShapeLayer.strokeColor = self.color.CGColor;
    self.closeShapeLayer.lineCap = kCALineCapButt;
    [self.layer addSublayer:self.closeShapeLayer];
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(self.size.width, self.size.height)];
    [path moveToPoint:CGPointMake(self.size.width, 0)];
    [path addLineToPoint:CGPointMake(0, self.size.height)];
    [path closePath];
    
    self.closeShapeLayer.path = path.CGPath;
}

#pragma mark - Action

- (void)buttonPressed:(id)sender {
    if (self.action) {
        self.action();
    }
}

@end
