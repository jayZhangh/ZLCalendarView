//
//  AppDelegate.h
//  ZLCalendarView
//
//  Created by ZhangLiang on 2019/9/18.
//  Copyright © 2019 jay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

