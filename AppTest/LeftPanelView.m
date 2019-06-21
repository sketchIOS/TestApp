//
//  LeftPanelView.m
//  AppTest
//
//  Created by IOS DEVELOPER on 15/11/17.
//  Copyright © 2017 IOS DEVELOPER. All rights reserved.
//

#import "LeftPanelView.h"

@implementation LeftPanelView
-(id)init{
    
    NSArray *nib =
    [[NSBundle mainBundle] loadNibNamed:@"LeftPanelView" owner:nil options:nil];
    
    self=[nib lastObject];
    return self;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
