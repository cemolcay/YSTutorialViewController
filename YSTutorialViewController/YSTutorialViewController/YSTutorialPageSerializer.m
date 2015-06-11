//
//  YSTutorialPageSerializer.m
//  YSTutorialViewController
//
//  Created by Cem Olcay on 11/06/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

#import "YSTutorialPageSerializer.h"
#import "YSTutorialPageView.h"

#define RGBColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@implementation YSTutorialPageSerializer

+ (NSArray *)tutorialPageViewsWithJSONFile:(NSString *)path {

    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:path ofType:@"json"];
    NSData *json = [NSData dataWithContentsOfFile:jsonPath];
    
    NSError *jsonError;
    NSArray *data = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:&jsonError];
    
    NSMutableArray *pages = [[NSMutableArray alloc] init];
    
    if (jsonError == nil) {
        
        for (NSDictionary *page in data) {
            
            NSString *colors = page[@"bottomViewColor"];
            NSArray *channels = [colors componentsSeparatedByString:@","];
            CGFloat r = [channels[0] floatValue];
            CGFloat g = [channels[1] floatValue];
            CGFloat b = [channels[2] floatValue];
            UIColor *color = RGBColor(r, g, b);
            
            [pages addObject:[[YSTutorialPageView alloc]
                              initWithImageNamed:page[@"imageName"]
                              bottomViewColor:color
                              iconNamed:page[@"iconName"]
                              title:page[@"title"]
                              text:page[@"text"]]];
        }
    }
    
    return [pages mutableCopy];
}

@end
