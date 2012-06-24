//
//  shout.h
//  ruckus
//
//  Created by Anna Billstrom on 6/23/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//



@interface shout : UIViewController <UITextFieldDelegate>{
    IBOutlet UITextField *tf;
    IBOutlet UIImageView *head;
    IBOutlet UITextView *gameInfoTV;
    
    
}

@property (nonatomic, retain) IBOutlet UITextField *tf;
@property (nonatomic, retain) IBOutlet UIImageView *head;
@property (nonatomic, retain)     IBOutlet UITextView *gameInfoTV;


-(IBAction)submitText;
-(IBAction)seeTopShouts;

@end
