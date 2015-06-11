//
//  YSTutorialPageView.m
//  YSTutorialViewController
//
//  Created by Cem Olcay on 11/06/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

#import "YSTutorialPageView.h"

@implementation YSTutorialPageView

- (instancetype)initWithImageNamed:(NSString *)imageName
                   bottomViewColor:(UIColor *)color
                         iconNamed:(NSString *)iconName
                             title:(NSString *)title
                              text:(NSString *)text {
    
    if ((self = [super init])) {
        
        self.imageName = imageName;
        self.bottomViewColor = color;
        self.iconName = iconName;
        self.title = title;
        self.text = text;
    }
    
    return self;
    
}

- (void)draw {
    
    CGFloat height = self.frame.size.height - self.appearance.tutorialPageBottomViewHeight;
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.imageName]];
    [self.imageView setCenter:CGPointMake(self.center.x, height/2)];
    [self addSubview:self.imageView];
    
    self.bottomView = [[YSTutorialPageBottomView alloc] initWithAppearance:self.appearance
                                                           backgroundColor:self.bottomViewColor
                                                                 iconNamed:self.iconName
                                                                     title:self.title
                                                                      text:self.text];
    [self addSubview:self.bottomView];
}

@end
