//
//  VerticalScrollView.m
//  Roam
//
//  Created by Richard Kim on 10/12/14.
//  Copyright (c) 2014 Richard Kim. All rights reserved.
//

#import "VerticalScrollView.h"

@implementation VerticalScrollView
@synthesize card;



-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self viewSetup];
    }
    return self;
}

-(void)viewSetup
{
    self.delegate = self;
    self.clipsToBounds = NO;
    [self setPagingEnabled:YES];
    [self setShowsVerticalScrollIndicator:NO];
    [self setShowsHorizontalScrollIndicator:NO];
    [self setContentOffset:CGPointMake(0,self.frame.size.height) animated:NO];
}

-(void)layoutSubviews
{
    [self setContentSize:CGSizeMake(self.frame.size.width, self.frame.size.height*3)];
    card.center = CGPointMake(self.contentSize.width / 2, self.contentSize.height / 2);
    [self addSubview:card];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    static NSInteger previousPage = 0;
    CGFloat pageHeight = scrollView.frame.size.height;
    float fractionalPage = scrollView.contentOffset.y / pageHeight;
    NSInteger page = lround(fractionalPage);
    if (previousPage != page) {
        // Page has changed, do your thing!
        // ...
        // Finally, update previous page
        NSLog(@"PAGE TURNED");
        previousPage = page;
    }
}


-(void) scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    if ([self didCompleteUpAction]) {
        NSLog(@"SWIPED UP");
    }
    if ([self didCompleteDownAction]) {
        NSLog(@"SWIPED DOWN");
    }
}

-(BOOL)didCompleteUpAction
{
    return YES;
}

-(BOOL)didCompleteDownAction
{
    return NO;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



@end
