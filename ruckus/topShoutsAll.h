//
//  topShoutsAll.h
//  ruckus
//
//  Created by Anna Billstrom on 6/23/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//



@interface topShoutsAll : UIViewController{
    IBOutlet UITextView *reaction1;
    IBOutlet UITextView *reaction2;
    IBOutlet UITextView *reaction3;
    
    IBOutlet UIImageView *head;
    IBOutlet UILabel *inning;

}

@property (nonatomic, retain) IBOutlet UITextView *reaction1;
@property (nonatomic, retain) IBOutlet UITextView *reaction2;
@property (nonatomic, retain) IBOutlet UITextView *reaction3;
@property (nonatomic, retain) IBOutlet UIImageView *head;
@property (nonatomic, retain) IBOutlet UILabel *inning;

-(IBAction)viewSpirits;
@end
