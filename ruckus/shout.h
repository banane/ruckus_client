//
//  shout.h
//  ruckus
//
//  Created by Anna Billstrom on 6/23/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//



@interface shout : UIViewController <UITextFieldDelegate>{
    IBOutlet UITextField *tf;
}

@property (nonatomic, retain) IBOutlet UITextField *tf;

-(IBAction)submitText;
-(IBAction)seeTopShouts;

@end
