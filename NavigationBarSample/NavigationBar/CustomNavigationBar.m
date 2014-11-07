//
//  CustomNavigationBar.m
//  NavigationBarSample
//
//  Created by 田邉　裕貴 on 2014/11/07.
//  Copyright (c) 2014年 田邉　裕貴. All rights reserved.
//

#import "CustomNavigationBar.h"

const CGFloat customNavigationBarHeightIncrease = 38.f;

@implementation CustomNavigationBar

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    [self setTransform:CGAffineTransformMakeTranslation(0, -(customNavigationBarHeightIncrease))];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self segmentedControlSetting];
}

- (void)segmentedControlSetting {
    float screenWidth = [UIScreen mainScreen].bounds.size.width;
    float segmentedControlWidth = 200.0f;
    float segmentedControlHeight = 30.0f;
    float segmentedControlPositionY = 80.0f;
    NSArray* items = @[@"📖", @"👓", @"@"];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
    segmentedControl.frame = CGRectMake(
                                        screenWidth / 2 - segmentedControlWidth / 2,
                                        segmentedControlPositionY,
                                        segmentedControlWidth,
                                        segmentedControlHeight
                                        );
    [self addSubview:segmentedControl];
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize newSize = [super sizeThatFits:size];
    newSize.height += customNavigationBarHeightIncrease;
    return newSize;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSArray *classNamesToReposition = @[@"_UINavigationBarBackground"];
    for (UIView *view in [self subviews]) {
        
        if ([classNamesToReposition containsObject:NSStringFromClass([view class])]) {
            
            CGRect bounds = [self bounds];
            CGRect frame = [view frame];
            frame.origin.y = bounds.origin.y + customNavigationBarHeightIncrease - 20.f;
            frame.size.height = bounds.size.height + 20.f;
            [view setFrame:frame];
            
        }
    }
}

@end
