//
//  ViewController.m
//  ZLCalendarView
//
//  Created by ZhangLiang on 2019/9/18.
//  Copyright © 2019 jay. All rights reserved.
//

#import "ViewController.h"
#import "ZLCalendarView.h"

@interface ViewController ()
- (IBAction)action:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)action:(id)sender {
    ZLCalendarView *calendarView = [ZLCalendarView calendarView];
    [calendarView showInView:self.view];
}
@end
