//
//  SPColor.h
//  ChangeColor
//
//  Created by to2dot@gmail.com on 13-2-20.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPColor : NSObject

@property (nonatomic, retain) UIColor* color;

+ (SPColor*)sharedColor;

@end
