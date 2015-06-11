//
//  YSTutorialPageBottomView.h
//  YSTutorialViewController
//
//  Created by Cem Olcay on 11/06/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSTutorialViewControllerAppearance.h"

@interface YSTutorialPageBottomView : UIView

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;

- (instancetype)initWithAppearance:(YSTutorialViewControllerAppearance *)appearance
                   backgroundColor:(UIColor *)color
                         iconNamed:(NSString *)iconName
                             title:(NSString *)title
                              text:(NSString *)text;

@end
