//
//  ViewController.m
//  ChangeColor
//
//  Created by to2dot@gmail.com on 13-2-20.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"
#import "DViewController.h"
#import "EViewController.h"
#import "SPColor.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)receiveBroadcast:(NSNotification*)notifiy
{
    NSLog(@"接收到广播：%@", notifiy);
    NSDictionary* colorDict = notifiy.userInfo;
    if (colorDict != nil) {
        float red = [[colorDict objectForKey:@"red"] floatValue];
        float green = [[colorDict objectForKey:@"green"] floatValue];
        float blue = [[colorDict objectForKey:@"blue"] floatValue];
        self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    }
}

- (void)go2AViewController:(id)sender
{
    // 方法1：将本页面指针传到下一个页面
    AViewController* aViewController = [[AViewController alloc] init];
    aViewController.prevViewController = self;
    [self.navigationController pushViewController:aViewController animated:YES];
    [aViewController release];
}

- (void)go2BViewController:(id)sender
{
    // 方法2：通过广播（通知）
    BViewController* bViewController = [[BViewController alloc] init];
    [self.navigationController pushViewController:bViewController animated:YES];
    [bViewController release];
}

- (void)go2CViewController:(id)sender
{
    // 方法3：通过block
    CViewController* cViewController = [[CViewController alloc] initwithBlock:^(UIColor *color) {
        self.view.backgroundColor = color;
    }];
    
    [self.navigationController pushViewController:cViewController animated:YES];
    [cViewController release];
}

- (void)go2DViewController:(id)sender
{
    // 方法4：通过AppDelegate
    DViewController* dViewController = [[DViewController alloc] init];
    [self.navigationController pushViewController:dViewController animated:YES];
    [dViewController release];
}

- (void)go2EViewController:(id)sender
{
    // 方法5：通过单例模式
    EViewController* eViewController = [[EViewController alloc] init];
    [self.navigationController pushViewController:eViewController animated:YES];
    [eViewController release];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 接收频段为“changeColor”的广播
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveBroadcast:) name:@"changeColor" object:nil];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(40, 30, 240, 40)];
    [button setTitle:@"方法一（通过指针）" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(go2AViewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(40, 100, 240, 40)];
    [button setTitle:@"方法二（通过广播）" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(go2BViewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(40, 170, 240, 40)];
    [button setTitle:@"方法三（通过block）" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(go2CViewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(40, 240, 240, 40)];
    [button setTitle:@"方法四（通过AppDelegate）" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(go2DViewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(40, 310, 240, 40)];
    [button setTitle:@"方法五（通过单例模式）" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(go2EViewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 方法5 取消此句注释
//    self.view.backgroundColor = [SPColor sharedColor].color;
  
#if 0
    // 取存在plist文件的的RGB值
    NSNumber* red = [[NSUserDefaults standardUserDefaults] objectForKey:@"red"];
    NSNumber* green = [[NSUserDefaults standardUserDefaults] objectForKey:@"green"];
    NSNumber* blue = [[NSUserDefaults standardUserDefaults] objectForKey:@"blue"];
    if (red != nil && green != nil && blue != nil) {
        self.view.backgroundColor = [UIColor colorWithRed:[red floatValue] green:[green floatValue] blue:[blue floatValue] alpha:1.0];
    }
#endif
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
