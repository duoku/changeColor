//
//  AViewController.m
//  ChangeColor
//
//  Created by to2dot@gmail.com on 13-2-20.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "AViewController.h"

#define RED_BUTTON_TAG 20
#define BLUE_BUTTON_TAG 21

@implementation AViewController

@synthesize prevViewController = _prevViewController;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)changeColor:(UIButton*)button
{
    CGFloat red = 0.0;
    CGFloat green = 0.0;
    CGFloat blue = 0.0;
    
    if (button.tag == RED_BUTTON_TAG) {
        red = 1.0;
    } else if (button.tag == BLUE_BUTTON_TAG) {
        blue = 1.0;
    }
    UIColor* color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.view.backgroundColor = color;
    self.prevViewController.view.backgroundColor = color;
    
    // 写入plist文件
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithFloat:red] forKey:@"red"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithFloat:green] forKey:@"green"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithFloat:blue] forKey:@"blue"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSNumber* red = [[NSUserDefaults standardUserDefaults] objectForKey:@"red"];
    NSNumber* green = [[NSUserDefaults standardUserDefaults] objectForKey:@"green"];
    NSNumber* blue = [[NSUserDefaults standardUserDefaults] objectForKey:@"blue"];
    if (red != nil && green != nil && blue != nil) {
        self.view.backgroundColor = [UIColor colorWithRed:[red floatValue] green:[green floatValue] blue:[blue floatValue] alpha:1.0];;
    }
    
    UIButton* redButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [redButton setTag:RED_BUTTON_TAG];
    [redButton setFrame:CGRectMake(40, 30, 100, 40)];
    [redButton setTitle:@"设为红色背景" forState:UIControlStateNormal];
    [redButton addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:redButton];
    
    UIButton* blueButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [blueButton setTag:BLUE_BUTTON_TAG];
    [blueButton setFrame:CGRectMake(180, 30, 100, 40)];
    [blueButton setTitle:@"设为蓝色背景" forState:UIControlStateNormal];
    [blueButton addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blueButton];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
