//
//  ZLCalendarView.h
//  FDCalendarDemo
//
//  Created by ZhangLiang on 15/9/20.
//  Copyright (c) 2015年 fergusding. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLCalendarView : UIView

@property (nonatomic, copy) void (^calendarViewBlock)(NSDate *date);

+ (instancetype)calendarView;
- (void)showInView:(UIView *)view;

@end
