//
//  ZLCalendarView.m
//  FDCalendarDemo
//
//  Created by ZhangLiang on 15/9/20.
//  Copyright (c) 2015年 fergusding. All rights reserved.
//

#import "ZLCalendarView.h"
#import "FDCalendar.h"

#define DeviceHeight [UIScreen mainScreen].bounds.size.height

@interface ZLCalendarView () <FDCalendarDelegate>

@property (nonatomic, strong) FDCalendar *calendar;
@property (nonatomic, strong) UIButton *btn_cover;
@property (nonatomic, strong) UIView *sperView;

@end

@implementation ZLCalendarView

+ (instancetype)calendarView {
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:[UIScreen mainScreen].bounds];
}

- (void)setupSubviews {
    if (!self.btn_cover) {
        self.btn_cover = [[UIButton alloc] initWithFrame:self.bounds];
        self.btn_cover.backgroundColor = [UIColor blackColor];
        self.btn_cover.alpha = 0.5;
        [self addSubview:self.btn_cover];
        [self.btn_cover addTarget:self action:@selector(btnAction_close) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (!self.calendar) {
        self.calendar = [[FDCalendar alloc] initWithCurrentDate:[NSDate date]];
        self.calendar.delegate = self;
        [self addSubview:self.calendar];
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
}

- (void)showInView:(UIView *)view {
    self.sperView = view;
    [self cleanOtherCalendarView];
    [view addSubview:self];
    CGRect rect = self.calendar.frame;
    rect.origin.y = self.frame.size.height;
    self.calendar.frame = rect;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGFloat f_calendarY = self.frame.size.height - self.calendar.frame.size.height;
        CGRect frame = self.calendar.frame;
        frame.origin.y = f_calendarY;
        self.calendar.frame = frame;
    }];
}

- (void)btnAction_close {
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = self.calendar.frame;
        frame.origin.y = self.frame.size.height;
        self.calendar.frame = frame;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)cleanOtherCalendarView {
    for (UIView *subview in self.sperView.subviews) {
        if ([subview isKindOfClass:[self class]]) {
            [self removeFromSuperview];
        }
    }
}

#pragma mark - FDCalendarDelegate
- (void)calendar:(FDCalendar *)calendar didSelectedDateItem:(NSDate *)date {
    if (self.calendarViewBlock) {
        self.calendarViewBlock(date);
    }
}

@end
