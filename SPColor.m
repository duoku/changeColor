//
//  SPColor.m
//  ChangeColor
//
//  Created by to2dot@gmail.com on 13-2-20.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "SPColor.h"

@implementation SPColor

@synthesize color = _color;

- (void)dealloc
{
    [_color release];
    [super dealloc];
}

+ (SPColor*)sharedColor
{
    static SPColor* sharedColor;
    
    @synchronized(self){
        if (sharedColor == nil) {
            sharedColor = [[self alloc] init];
        }
    }
    return sharedColor;
}

@end
