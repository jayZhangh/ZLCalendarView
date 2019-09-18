//
//  FDCalendar.h
//  FDCalendarDemo
//
//  Created by fergusding on 15/8/20.
//  Copyright (c) 2015年 fergusding. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FDCalendar;

@protocol FDCalendarDelegate <NSObject>

/**
*  选中了日期
*
*  @param calendar 日历
*  @param date     选择的日期
*/
- (void)calendar:(FDCalendar *)calendar didSelectedDateItem:(NSDate *)date;

@end

@interface FDCalendar : UIView

@property (nonatomic, assign) id<FDCalendarDelegate> delegate;

- (instancetype)initWithCurrentDate:(NSDate *)date;

@end
