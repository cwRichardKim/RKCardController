//
//  Card.m
//  Roam
//
//  Created by Richard Kim on 10/11/14.
//  Copyright (c) 2014 Richard Kim. All rights reserved.
//

#import "Card.h"

@implementation Card

-(id)init
{
    self = [super init];
    if (self) {
        [self cardSetup];
    }
    return self;
}

-(void)cardSetup
{
    
}


-(void)layoutSubviews {
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 8;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
