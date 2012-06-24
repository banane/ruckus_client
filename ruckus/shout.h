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
    IBOutlet UILabel *inningL;
    IBOutlet UILabel *battingL;
    IBOutlet UILabel *pitcherL;
    IBOutlet UILabel *scoreL;
    IBOutlet UITextView *playTV;
    
}

@property (nonatomic, retain) IBOutlet UITextField *tf;
@property (nonatomic, retain) IBOutlet UIImageView *head;
@property (nonatomic, retain)     IBOutlet UITextView *gameInfoTV;
@property (nonatomic, retain) IBOutlet UILabel *inningL;
@property (nonatomic, retain) IBOutlet UILabel *battingL;
@property (nonatomic, retain) IBOutlet UILabel *pitcherL;
@property (nonatomic, retain) IBOutlet UILabel *scoreL;
@property (nonatomic, retain) IBOutlet UITextView *playTV;

-(IBAction)submitText;
-(IBAction)seeTopShouts;

@end
