//
//  YSTutorialPageBottomView.m
//  YSTutorialViewController
//
//  Created by Cem Olcay on 11/06/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

#import "YSTutorialPageBottomView.h"

@implementation YSTutorialPageBottomView

- (instancetype)initWithAppearance:(YSTutorialViewControllerAppearance *)appearance
                   backgroundColor:(UIColor *)color
                         iconNamed:(NSString *)iconName
                             title:(NSString *)title
                              text:(NSString *)text {

    if ((self = [super init])) {
        
        CGFloat height = appearance.tutorialPageBottomViewHeight;
        self.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - height, [UIScreen mainScreen].bounds.size.width, height);
        self.backgroundColor = color;
        
        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 30, 30)];
        [self.iconView setImage:[UIImage imageNamed:iconName]];
        [self.iconView setCenter:CGPointMake(self.center.x, self.iconView.center.y)];
        [self.iconView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:self.iconView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width - 20, 0)];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.text = title;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = appearance.titleLabelColor;
        self.titleLabel.font = appearance.titleLabelFont;
        [self.titleLabel sizeToFit];
        self.titleLabel.frame = CGRectMake(10, self.iconView.frame.origin.y + self.iconView.frame.size.height + 10, self.frame.size.width - 20, self.titleLabel.frame.size.height);
        [self addSubview:self.titleLabel];
        
        self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width - 20, 0)];
        self.descriptionLabel.numberOfLines = 0;
        self.descriptionLabel.text = text;
        self.descriptionLabel.textAlignment = NSTextAlignmentCenter;
        self.descriptionLabel.textColor = appearance.descriptionLabelColor;
        self.descriptionLabel.font = appearance.descriptionLabelFont;
        [self.descriptionLabel sizeToFit];
        self.descriptionLabel.frame = CGRectMake(10, self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height + 10, self.frame.size.width - 20, self.descriptionLabel.frame.size.height);
        [self addSubview:self.descriptionLabel];
    }
    
    return self;
}


@end
