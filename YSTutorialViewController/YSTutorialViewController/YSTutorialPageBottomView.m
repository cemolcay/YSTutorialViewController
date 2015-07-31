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
        
        self.iconView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.iconView.translatesAutoresizingMaskIntoConstraints = NO;
        CGSize iconSize = CGSizeMake(0.0, 0.0);
        if (iconName != nil) {
            [self.iconView setImage:[UIImage imageNamed:iconName]];
            iconSize = self.iconView.image.size;
        }
        [self.iconView setContentMode:UIViewContentModeCenter];
        [self addSubview:self.iconView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.text = title;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = appearance.titleLabelColor;
        self.titleLabel.font = appearance.titleLabelFont;
        [self.titleLabel sizeToFit];
        [self addSubview:self.titleLabel];
        
        self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.descriptionLabel.numberOfLines = 0;
        self.descriptionLabel.text = text;
        self.descriptionLabel.textAlignment = NSTextAlignmentCenter;
        self.descriptionLabel.textColor = appearance.descriptionLabelColor;
        self.descriptionLabel.font = appearance.descriptionLabelFont;
        [self.descriptionLabel sizeToFit];
        [self addSubview:self.descriptionLabel];
        
        NSDictionary *viewsForAutolayout = @{ @"superview": self, @"icon" : self.iconView, @"title" : self.titleLabel, @"description" : self.descriptionLabel };
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[superview]-(<=1)-[icon]" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewsForAutolayout]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[icon(==iconWidth)]" options:NSLayoutFormatAlignAllCenterX metrics:@{@"iconWidth" : @(iconSize.height)} views:viewsForAutolayout]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[title]-10-|" options:0 metrics:nil views:viewsForAutolayout]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[title]-10-|" options:0 metrics:nil views:viewsForAutolayout]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[description]-10-|" options:0 metrics:nil views:viewsForAutolayout]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[icon(==iconHeight)]-10-[title]-10-[description]-(>=1)-|" options:0 metrics:@{@"iconHeight" : @(iconSize.height)} views:viewsForAutolayout]];
    }
    
    return self;
}

@end
