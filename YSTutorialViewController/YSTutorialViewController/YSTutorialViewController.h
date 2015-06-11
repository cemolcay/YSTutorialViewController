//
//  YSTutorialViewController.h
//  YSTutorialViewController
//
//  Created by Cem Olcay on 11/06/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YSTutorialViewControllerAppearance.h"
#import "YSTutorialPageView.h"
#import "YSTutorialViewControllerCloseButton.h"

@protocol YSTutorialViewControllerDataSource;
@protocol YSTutorialViewControllerDelegate;

@interface YSTutorialViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) NSMutableArray *backgroundImageViews;
@property (nonatomic, strong) UIView *overlay;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) YSTutorialViewControllerCloseButton *closeButton;
@property (nonatomic, strong) YSTutorialViewControllerAppearance *appearance;

@property (nonatomic, weak) id<YSTutorialViewControllerDataSource> dataSource;
@property (nonatomic, weak) id<YSTutorialViewControllerDelegate> delegate;

- (void)reloadTutorialViewController;
- (instancetype)initWithAppearance:(YSTutorialViewControllerAppearance *)appearance;

@end


#pragma mark - DataSource

@protocol YSTutorialViewControllerDataSource

- (NSInteger)numberOfPagesInTutorialViewController:(YSTutorialViewController *)viewController;
- (YSTutorialPageView *)tutorialViewController:(YSTutorialViewController *)viewController tutorialPageViewForIndex:(NSInteger)index;

@end


#pragma mark - Delegate

@protocol YSTutorialViewControllerDelegate

@optional

- (UIImage *)tutorialViewControllerBackgroundImageForIndex:(NSInteger)index;
- (void)tutorialViewControllerDidPressedCloseButton: (YSTutorialViewController *)viewController;
- (void)tutorialViewController:(YSTutorialViewController *)viewController didScrollToPageAtIndex:(NSInteger)index;

@end

