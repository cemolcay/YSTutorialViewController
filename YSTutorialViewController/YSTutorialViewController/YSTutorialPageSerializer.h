//
//  YSTutorialPageSerializer.h
//  YSTutorialViewController
//
//  Created by Cem Olcay on 11/06/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSTutorialPageSerializer : NSObject

+ (NSArray *)tutorialPageViewsWithJSONFile:(NSString *)path;

@end
