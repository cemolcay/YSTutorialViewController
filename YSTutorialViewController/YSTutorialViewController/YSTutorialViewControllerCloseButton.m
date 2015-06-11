//
//  YSTutorialViewControllerCloseButton.m
//  YSTutorialViewController
//
//  Created by Cem Olcay on 11/06/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

#import "YSTutorialViewControllerCloseButton.h"

#define ButtonSize 20
#define RightPad 20

@implementation YSTutorialViewControllerCloseButton

#pragma mark - Init

- (instancetype)initWithColor:(UIColor *)color lineWidth:(CGFloat)lineWidth action:(YSTutorialViewControllerCloseButtonAction)action {
    
    if ((self = [super init])) {
        
        self.color = color;
        self.lineWidth = lineWidth;
        self.action = action;
        
        self.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - RightPad - ButtonSize,
                                40,
                                [self buttonSize].width,
                                [self buttonSize].height);
        
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
    [path addLineToPoint:CGPointMake([self buttonSize].width, [self buttonSize].height)];
    [path moveToPoint:CGPointMake([self buttonSize].width, 0)];
    [path addLineToPoint:CGPointMake(0, [self buttonSize].height)];
    [path closePath];
    
    self.closeShapeLayer.path = path.CGPath;
}

# pragma mark - Size

- (CGSize)buttonSize {
    return CGSizeMake(ButtonSize, ButtonSize);
}


#pragma mark - Action

- (void)buttonPressed:(id)sender {
    if (self.action) {
        self.action();
    }
}

@end
