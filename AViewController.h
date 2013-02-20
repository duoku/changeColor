//
//  AViewController.h
//  ChangeColor
//
//  Created by to2dot@gmail.com on 13-2-20.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AViewController : UIViewController
{
@private
    UIViewController* _prevViewController;
}

@property (nonatomic, assign) UIViewController* prevViewController;

@end
