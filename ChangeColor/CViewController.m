//
//  CViewController.m
//  ChangeColor
//
//  Created by to2dot@gmail.com on 13-2-20.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "CViewController.h"
#define RED_BUTTON_TAG 22
#define GREEN_BUTTON_TAG 23

@implementation CViewController

- (void)dealloc
{
    [_colorChangeBlock release];
    [super dealloc];
}

-(id)initwithBlock:(ChangeColorBlockT)cb
{
    self = [super init];
    if (self) {   
        _colorChangeBlock = [cb copy];
    }
    return self;
}


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
    } else if (button.tag == GREEN_BUTTON_TAG) {
        green = 1.0;
    }
    UIColor* color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.view.backgroundColor = color;
    
    if (_colorChangeBlock) {
        _colorChangeBlock(color);
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton* redButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [redButton setTag:RED_BUTTON_TAG];
    [redButton setFrame:CGRectMake(40, 30, 100, 40)];
    [redButton setTitle:@"设为红色背景" forState:UIControlStateNormal];
    [redButton addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:redButton];
    
    UIButton* greenButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [greenButton setTag:GREEN_BUTTON_TAG];
    [greenButton setFrame:CGRectMake(180, 30, 100, 40)];
    [greenButton setTitle:@"设为蓝色背景" forState:UIControlStateNormal];
    [greenButton addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:greenButton];
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
