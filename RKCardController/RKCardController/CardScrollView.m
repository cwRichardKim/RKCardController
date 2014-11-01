//
//  CardScrollView.m
//  Roam
//
//  Created by Richard Kim on 10/11/14.
//  Copyright (c) 2014 Richard Kim. All rights reserved.
//

#import "CardScrollView.h"
#import "Card.h"
#import "VerticalScrollView.h"

static const int Y_TOP_BUFFER = 30;
static const int Y_BOT_BUFFER = 80;
static const int X_BUFFER = 15;
static const int CARD_X_BUFFER = 5;

@implementation CardScrollView {
    NSMutableArray* cardsArray;
}

-(id)initWithCards:(NSArray*)cards
{
    self = [super init];
    if (self) {
        cardsArray = [[NSMutableArray alloc]initWithArray:cards];
        [self viewSetup];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    CGRect newFrame = frame;
    newFrame.origin.x += X_BUFFER;
    newFrame.size.width -= X_BUFFER*2;
    self = [super initWithFrame:newFrame];
    if (self) {
        [self viewSetup];
    }
    return self;
}

-(id)init
{
    self = [super init];
    if (self) {
        [self viewSetup];
    }
    return self;
}

-(void)viewSetup
{
    [self setClipsToBounds:NO];
     
}

-(void)layoutSubviews
{
    [self setPagingEnabled:YES];
    [self setShowsHorizontalScrollIndicator:NO];
    [self setShowsVerticalScrollIndicator:NO];
}


-(void)addCards:(NSArray*)cards
{
    if (!cardsArray) {
        cardsArray = [[NSMutableArray alloc]init];
    }
    for (Card* card in cards) {
        [self addCard:card];
    }
}

-(void)addCard:(Card*) card
{
    VerticalScrollView *vScrollView = [[VerticalScrollView alloc]initWithFrame:CGRectMake(cardsArray.count*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
    card.frame = CGRectMake(CARD_X_BUFFER, Y_TOP_BUFFER, vScrollView.frame.size.width - 2*CARD_X_BUFFER, vScrollView.frame.size.height - Y_TOP_BUFFER - Y_BOT_BUFFER);
    vScrollView.card = card;
    [cardsArray addObject:vScrollView];
    [self addSubview:vScrollView];
    [self expandScrollView];
}

-(void)expandScrollView
{
    CGSize size = self.contentSize;
    size.width += self.frame.size.width;
    self.contentSize = size;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
