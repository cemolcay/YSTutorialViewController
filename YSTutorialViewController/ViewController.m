//
//  ViewController.m
//  YSTutorialViewController
//
//  Created by Cem Olcay on 11/06/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

#import "ViewController.h"
#import "YSTutorialPageSerializer.h"

@implementation ViewController

#pragma  mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tutorialPages = [[NSMutableArray alloc] initWithArray:[YSTutorialPageSerializer tutorialPageViewsWithJSONFile:@"tutorialPages"]];
    
    self.tutorialViewController = [[YSTutorialViewController alloc] init];
    [self.tutorialViewController setDataSource:self];
    [self.tutorialViewController setDelegate:self];
    [self.tutorialViewController reloadTutorialViewController];
    [self.view addSubview:self.tutorialViewController.view];
}

#pragma mark - YSTutorialViewControllerDataSource

- (NSInteger)numberOfPagesInTutorialViewController:(YSTutorialViewController *)viewController {
    return self.tutorialPages.count;
}

- (YSTutorialPageView *)tutorialViewController:(YSTutorialViewController *)viewController tutorialPageViewForIndex:(NSInteger)index {
    return (YSTutorialPageView *)self.tutorialPages[index];
}


#pragma mark - YSTutorialViewControllerDelegate

- (UIImage *)tutorialViewControllerBackgroundImageForIndex:(NSInteger)index {
    
    if (index == 0) {
        return [UIImage imageNamed:@"tut1Background.png"];
    } else if (index == 1) {
        return [UIImage imageNamed:@"tut2Background.png"];
    } else if (index == 2) {
        return [UIImage imageNamed:@"tut3Background.png"];
    }
    
    return nil;
}

- (void)tutorialViewControllerDidPressedCloseButton:(YSTutorialViewController *)viewController {
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)tutorialViewController:(YSTutorialViewController *)viewController didScrollToPageAtIndex:(NSInteger)index {

}


#pragma mark - StatusBar

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
