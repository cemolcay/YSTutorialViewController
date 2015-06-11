//
//  ViewController.h
//  YSTutorialViewController
//
//  Created by Cem Olcay on 11/06/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YSTutorialViewController.h"

@interface ViewController : UIViewController <YSTutorialViewControllerDataSource, YSTutorialViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *tutorialPages;
@property (nonatomic, strong) YSTutorialViewController *tutorialViewController;

@end

