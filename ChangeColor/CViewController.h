//
//  CViewController.h
//  ChangeColor
//
//  Created by to2dot@gmail.com on 13-2-20.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ChangeColorBlockT)(UIColor* color);

@interface CViewController : UIViewController
{
@private
    ChangeColorBlockT _colorChangeBlock;
}

-(id)initwithBlock:(ChangeColorBlockT)cb;

@end
