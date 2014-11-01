//
//  ClipView.m
//  Roam
//
//  Created by Richard Kim on 10/12/14.
//  Copyright (c) 2014 Richard Kim. All rights reserved.
//

#import "ClipView.h"

@implementation ClipView
@synthesize scrollView;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return [self pointInside:point withEvent:event] ? scrollView : nil;
}
@end
