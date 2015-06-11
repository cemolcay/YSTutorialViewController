//
//  YSTutorialPageView.h
//  YSTutorialViewController
//
//  Created by Cem Olcay on 11/06/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YSTutorialViewControllerAppearance.h"
#import "YSTutorialPageBottomView.h"

@interface YSTutorialPageView : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) YSTutorialPageBottomView *bottomView;

@property (nonatomic, weak) YSTutorialViewControllerAppearance *appearance;

@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *iconName;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UIColor *bottomViewColor;

- (instancetype)initWithImageNamed:(NSString *)imageName
                   bottomViewColor:(UIColor *)color
                         iconNamed:(NSString *)iconName
                             title:(NSString *)title
                              text:(NSString *)text;

- (void)draw;

@end
