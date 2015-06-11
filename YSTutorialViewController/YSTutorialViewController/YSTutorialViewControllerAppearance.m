//
//  YSTutorialViewControllerAppearance.m
//  YSTutorialViewController
//
//  Created by Cem Olcay on 11/06/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

#import "YSTutorialViewControllerAppearance.h"

@implementation YSTutorialViewControllerAppearance

- (instancetype)initWithTitleLabelColor:(UIColor *)titleLabelColor
                         titleLabelFont:(UIFont *)titleLabelFont
                  descriptionLabelColor:(UIColor *)descriptionLabelColor
                   descriptionLabelFont:(UIFont *)descrtipionLabelFont
                   pageControlTintColor:(UIColor *)pageControlTintColor
        backgronudImageViewOverlayAlpha:(CGFloat)overlayAlpha
        backgroundImageViewOverlayColor:(UIColor *)overlayColor
                       closeButtonColor:(UIColor *)closeButtonColor
                   closeButtonLineWidth:(CGFloat)closeButtonLineWidth
           tutorialPageBottomViewHeight:(CGFloat)height {
    
    if ((self = [super init])) {
    
        self.titleLabelColor = titleLabelColor;
        self.titleLabelFont = titleLabelFont;
        
        self.descriptionLabelColor = descriptionLabelColor;
        self.descriptionLabelFont = descrtipionLabelFont;
        
        self.backgroundImageViewOverlayAlpha = overlayAlpha;
        self.backgroundImageViewOverlayColor = overlayColor;
        
        self.pageControlTintColor = pageControlTintColor;
        self.tutorialPageBottomViewHeight = height;
        
        self.closeButtonColor = closeButtonColor;
        self.closeButtonLineWidth = closeButtonLineWidth;
    }
    return self;
}

+ (YSTutorialViewControllerAppearance *)defaultAppearance {
    return [[YSTutorialViewControllerAppearance alloc]
            initWithTitleLabelColor:[UIColor whiteColor]
            titleLabelFont:[UIFont boldSystemFontOfSize:16]
            descriptionLabelColor:[UIColor whiteColor]
            descriptionLabelFont:[UIFont systemFontOfSize:15]
            pageControlTintColor:[UIColor whiteColor]
            backgronudImageViewOverlayAlpha:0.5
            backgroundImageViewOverlayColor:[UIColor blackColor]
            closeButtonColor: [UIColor whiteColor]
            closeButtonLineWidth: 1
            tutorialPageBottomViewHeight:200];
}


@end
