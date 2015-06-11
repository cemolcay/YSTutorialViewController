//
//  YSTutorialViewController.m
//  YSTutorialViewController
//
//  Created by Cem Olcay on 11/06/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

#import "YSTutorialViewController.h"

@implementation YSTutorialViewController

#pragma mark - Init

- (instancetype)initWithAppearance:(YSTutorialViewControllerAppearance *)appearance {
    
    if ((self = [super init])) {
        self.appearance = appearance;
    }
    return self;
}

- (instancetype)init {
    
    if ((self = [super init])) {
        self.appearance = [YSTutorialViewControllerAppearance defaultAppearance];
    }
    return self;
}


#pragma mark - Reload

- (void)reloadTutorialViewController {

    NSInteger count = [self.dataSource numberOfPagesInTutorialViewController:self];

    // reset background image view
    
    if (self.backgroundImageViews && self.backgroundImageViews.count > 0) {
        for (UIImageView *img in self.backgroundImageViews) {
            [img removeFromSuperview];
        }
    }
    
    self.backgroundImageViews = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < count; i++) {
        
        UIImageView *img = [[UIImageView alloc] initWithFrame:self.view.frame];
        img.image = [self.delegate tutorialViewControllerBackgroundImageForIndex:i];
        [self.view addSubview:img];
        
        if (i > 0) {
            [img setAlpha:0];
        }
        
        [self.backgroundImageViews addObject:img];
    }
    
    
    // reset overlay
    
    if ([self overlay] != nil) {
        [self.overlay removeFromSuperview];
        [self setOverlay:nil];
    }
    
    self.overlay = [[UIView alloc] initWithFrame:self.view.frame];
    [self.overlay setBackgroundColor:self.appearance.backgroundImageViewOverlayColor];
    [self.overlay setAlpha:self.appearance.backgroundImageViewOverlayAlpha];
    [self.view addSubview:self.overlay];
    
    
    // reset scroll view
    
    if ([self scrollView] != nil)  {
        [self.scrollView removeFromSuperview];
        [self setScrollView:nil];
    }
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.scrollView setDelegate:self];
    [self.scrollView setPagingEnabled:YES];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    [self.scrollView setShowsVerticalScrollIndicator:NO];
    [self.view addSubview:self.scrollView];
    
    
    // load pages
    
    for (int i = 0; i < count; i++) {
        
        YSTutorialPageView *page = [self.dataSource tutorialViewController:self tutorialPageViewForIndex:i];
        [page setFrame:self.scrollView.frame];
        [page setAppearance:self.appearance];
        [page draw];
        
        CGFloat x = i * self.scrollView.frame.size.width;
        [page setFrame:CGRectMake(x, 0, page.frame.size.width, page.frame.size.height)];
        
        [self.scrollView addSubview:page];
    }
    
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width * count, self.scrollView.frame.size.height)];
    
      
    // reset page control
    
    if ([self pageControl] != nil) {
        [self.pageControl removeFromSuperview];
        [self setPageControl:nil];
    }
    
    CGFloat pageControlH = 20;
    CGFloat pageControlBottomPad = 10;
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.scrollView.frame.size.height - pageControlH - pageControlBottomPad, self.scrollView.frame.size.width, pageControlH)];
    [self.pageControl setNumberOfPages:count];
    [self.view addSubview:self.pageControl];
    
    
    // setup close button
    
    if (self.closeButton == nil) {
        __weak typeof(self) weakSelf = self;
        self.closeButton = [[YSTutorialViewControllerCloseButton alloc]
                            initWithColor:self.appearance.closeButtonColor
                            lineWidth:self.appearance.closeButtonLineWidth
                            action:^{
                                [weakSelf.delegate tutorialViewControllerDidPressedCloseButton:weakSelf];
                            }];
        [self.view addSubview:self.closeButton];
    }
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    if (scrollView == self.scrollView) {
        
        CGFloat current = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
        NSInteger curr = (NSInteger)current;
        
        if (self.pageControl.currentPage != curr) {
            [self.pageControl setCurrentPage:curr];
            [self.delegate tutorialViewController:self didScrollToPageAtIndex:curr];
        }
        
        if (curr != self.backgroundImageViews.count - 1) {
            [(UIImageView *)self.backgroundImageViews[curr+1] setAlpha:current-curr];
        }
    }
}

@end
