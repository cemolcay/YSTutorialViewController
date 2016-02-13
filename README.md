YSTutorialViewController
========================

Create flat design tutorial pages quickly. 
It can read page data from json file, no coding required for pages !
Fully customisable.

Demo
----

![alt tag](https://raw.githubusercontent.com/cemolcay/YSTutorialViewController/master/demo.gif)


Install
-------

### Manual

Copy & paste `YSTutorialViewController` folder into your project

### CocoaPods

``` ruby
pod 'YSTutorialViewController'
```

Usage
-----

Create a `YSTutorialViewController`.

``` objective-c
	 self.tutorialViewController = [[YSTutorialViewController alloc] init];
    [self.tutorialViewController setDataSource:self];
    [self.tutorialViewController setDelegate:self];
    [self.tutorialViewController reloadTutorialViewController];
    [self.view addSubview:self.tutorialViewController.view];
```



### YSTutorialViewControllerDataSource

Feed the data source with your pages array

``` objective-c
- (NSInteger)numberOfPagesInTutorialViewController:(YSTutorialViewController *)viewController {
    return self.tutorialPages.count;
}

- (YSTutorialPageView *)tutorialViewController:(YSTutorialViewController *)viewController tutorialPageViewForIndex:(NSInteger)index {
    return (YSTutorialPageView *)self.tutorialPages[index];
}
```

### YSTutorialViewControllerDelegate

Optional delegate methods for taking control of actions

``` objective-c
@protocol YSTutorialViewControllerDelegate

@optional

- (UIImage *)tutorialViewControllerBackgroundImageForIndex:(NSInteger)index;
- (void)tutorialViewControllerDidPressedCloseButton: (YSTutorialViewController *)viewController;
- (void)tutorialViewController:(YSTutorialViewController *)viewController didScrollToPageAtIndex:(NSInteger)index;

@end
```

### YSTutorialPageSerializer

If you want to use a json file for creating pages you can serialize a `YSTutorialPageView` array with `+ (NSArray *)tutorialPageViewsWithJSONFile:(NSString *)path` method

``` objective-c
    self.tutorialPages = [YSTutorialPageSerializer tutorialPageViewsWithJSONFile:@"tutorialPages"];
```


### Creating `YSTutorialPageView`s manually

``` objective-c
    YSTutorialPageView *page = [[YSTutorialPageView alloc] initWithImageNamed:@"tutImage.png"
                                                              bottomViewColor:[UIColor redColor]
                                                                    iconNamed:@"tutIcon.png"
                                                                        title:@"Title goes here"
                                                                         text:@"This is the text that describes your app's awesome feature"];
```

### YSTutorialViewControllerAppearance

You can describe an appearance and init your YSTutorialViewController with it.
YSTutorialViewControllerAppearance looks like this

``` objective-c

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

```

``` objective-c
- (instancetype)initWithAppearance:(YSTutorialViewControllerAppearance *)appearance;
```
