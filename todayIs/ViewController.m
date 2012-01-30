//
//  ViewController.m
//  todayIs
//
//  Created by Wataru Nishimoto on 12/01/30.
//  Copyright (c) 2012年 none. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize status;
@synthesize formt;
-(void) switch:(id)sender{
    UILocalNotification *ln = [[UILocalNotification alloc] init];
    
    if (status.on){
        NSDate *dt = [NSDate date];
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"YYYY-MM-dd"];
        dt = [df dateFromString:[df stringFromDate:dt]];
        for (int i = 0; i< 182; i++){
            
            NSCalendar* cal = [[NSCalendar alloc] initWithCalendarIdentifier: NSJapaneseCalendar];
            NSLocale* locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
            [df setCalendar: cal];
            [df setLocale:locale];
            [df setDateFormat:formt.text];
            // [formatter setDateFormat:@"YYYY年MM月dd日 EEEE"];
            NSString* str = [df stringFromDate:dt];         
            ln.timeZone = [NSTimeZone defaultTimeZone];
            ln.fireDate = dt;
            ln.alertBody = str;
            ln.applicationIconBadgeNumber = 0;
            ln.hasAction = NO;            
            [[UIApplication sharedApplication] scheduleLocalNotification:ln];
            dt = [NSDate dateWithTimeInterval:60*60*24 sinceDate:dt];
            str = [df stringFromDate:dt];
        }
        
    }else{
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
    }
    NSUserDefaults *ud =  [NSUserDefaults standardUserDefaults];
    [ud setObject:formt.text forKey:@"formt"];
    [ud setBool:status.on forKey:@"status"];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *ud =  [NSUserDefaults standardUserDefaults];
    bool st = [ud boolForKey:@"status"];
    formt.text = [ud stringForKey:@"formt"];
    if (formt.text == nil) {
        formt.text = @"GGyy年MM月dd日 EEEE";
    }
    status.on = st;
    [status addTarget:self action:@selector(switch:)
     forControlEvents:UIControlEventValueChanged];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
