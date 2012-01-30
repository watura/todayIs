//
//  ViewController.h
//  todayIs
//
//  Created by Wataru Nishimoto on 12/01/30.
//  Copyright (c) 2012年 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UISwitch *status; 
}

@property (strong,nonatomic) IBOutlet UISwitch *status;
@property (strong,nonatomic) IBOutlet UITextField *formt;
-(void) switch:(id)sender;

@end
