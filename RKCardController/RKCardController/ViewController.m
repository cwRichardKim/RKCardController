//
//  ViewController.m
//  Roam
//
//  Created by Richard Kim on 10/11/14.
//  Copyright (c) 2014 Richard Kim. All rights reserved.
//

#import "ViewController.h"
#import "Card.h"
#import "CardScrollView.h"
#import "ClipView.h"


@interface ViewController () {
    CardScrollView *myScrollView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    myScrollView = [[CardScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    Card *card = [[Card alloc] init];
    Card *card2 = [[Card alloc] init];
    [myScrollView addCards:@[card, card2]];
    [self setupClipView];
    [self.view addSubview: myScrollView];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setupClipView
{
    ClipView* clipView = [[ClipView alloc]initWithFrame:self.view.frame];
    clipView.scrollView = myScrollView;
    [self.view addSubview:clipView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
