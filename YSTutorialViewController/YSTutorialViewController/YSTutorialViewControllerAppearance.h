//
//  YSTutorialViewControllerAppearance.h
//  YSTutorialViewController
//
//  Created by Cem Olcay on 11/06/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSTutorialViewControllerAppearance : NSObject

@property (nonatomic, strong) UIColor *titleLabelColor;
@property (nonatomic, strong) UIFont *titleLabelFont;

@property (nonatomic, strong) UIColor *descriptionLabelColor;
@property (nonatomic, strong) UIFont *descriptionLabelFont;

@property (nonatomic, assign) CGFloat tutorialPageBottomViewHeight;
@property (nonatomic, strong) UIColor *pageControlTintColor;

@property (nonatomic, assign) CGFloat backgroundImageViewOverlayAlpha;
@property (nonatomic, strong) UIColor *backgroundImageViewOverlayColor;

@property (nonatomic, strong) UIColor *closeButtonColor;
@property (nonatomic, assign) CGFloat closeButtonLineWidth;

- (instancetype)initWithTitleLabelColor: (UIColor *)titleLabelColor
                         titleLabelFont: (UIFont *)titleLabelFont
                  descriptionLabelColor: (UIColor *)descriptionLabelColor
                   descriptionLabelFont: (UIFont *) descrtipionLabelFont
                   pageControlTintColor: (UIColor *)pageControlTintColor
        backgronudImageViewOverlayAlpha: (CGFloat)overlayAlpha
        backgroundImageViewOverlayColor: (UIColor *)overlayColor
                       closeButtonColor: (UIColor *)closeButtonColor
                   closeButtonLineWidth: (CGFloat)closeButtonLineWidth
          tutorialPageBottomViewHeight : (CGFloat)height;

+ (YSTutorialViewControllerAppearance *)defaultAppearance;

@end
