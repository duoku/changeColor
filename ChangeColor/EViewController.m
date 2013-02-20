//
//  EViewController.m
//  ChangeColor
//
//  Created by to2dot@gmail.com on 13-2-20.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "EViewController.h"
#import "SPColor.h"

#define GREEN_BUTTON_TAG 10
#define YELLOW_BUTTON_TAG 11

@implementation EViewController

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
    
    if (button.tag == GREEN_BUTTON_TAG) {
        green = 1.0;
    } else if (button.tag == YELLOW_BUTTON_TAG) {
        red = 1.0;
        green = 1.0;
    }
    UIColor* color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.view.backgroundColor = color;
    
    [SPColor sharedColor].color = color;
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton* greenButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [greenButton setTag:GREEN_BUTTON_TAG];
    [greenButton setFrame:CGRectMake(40, 30, 100, 40)];
    [greenButton setTitle:@"设为绿色背景" forState:UIControlStateNormal];
    [greenButton addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:greenButton];
    
    UIButton* yellowButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [yellowButton setTag:YELLOW_BUTTON_TAG];
    [yellowButton setFrame:CGRectMake(180, 30, 100, 40)];
    [yellowButton setTitle:@"设为黄色背景" forState:UIControlStateNormal];
    [yellowButton addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:yellowButton];
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
