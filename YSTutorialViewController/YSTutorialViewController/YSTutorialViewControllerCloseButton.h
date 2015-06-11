//
//  YSTutorialViewControllerCloseButton.h
//  YSTutorialViewController
//
//  Created by Cem Olcay on 11/06/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^YSTutorialViewControllerCloseButtonAction)(void);

@interface YSTutorialViewControllerCloseButton : UIButton

@property (nonatomic, copy) YSTutorialViewControllerCloseButtonAction action;

@property (nonatomic, strong) CAShapeLayer *closeShapeLayer;

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat lineWidth;

- (instancetype)initWithColor:(UIColor *)color lineWidth:(CGFloat)lineWidth action:(YSTutorialViewControllerCloseButtonAction)action;
- (void)draw;

@end
