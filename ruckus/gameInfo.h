//
//  gameInfo.h
//  ruckus
//
//  Created by Anna Billstrom on 6/24/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface gameInfo : UIViewController {
    IBOutlet UITextView *topRuckusTV;
    IBOutlet UILabel *inningL;
    IBOutlet UILabel *battingL;
    IBOutlet UILabel *pitcherL;
    IBOutlet UILabel *scoreL;
    IBOutlet UITextView *playTV;
    IBOutlet UIImageView *head;
}

@property (nonatomic, retain) IBOutlet UITextView *topRuckusTV;
@property (nonatomic, retain) IBOutlet UILabel *inningL;
@property (nonatomic, retain) IBOutlet UILabel *battingL;
@property (nonatomic, retain) IBOutlet UILabel *pitcherL;
@property (nonatomic, retain) IBOutlet UILabel *scoreL;
@property (nonatomic, retain) IBOutlet UITextView *playTV;
@property (nonatomic, retain) IBOutlet UIImageView *head;

-(IBAction)viewChoose;

@end
