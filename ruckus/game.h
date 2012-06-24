//
//  game.h
//  ruckus
//
//  Created by Anna Billstrom on 6/23/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//



@interface game : UIViewController
{
    IBOutlet UILabel *gameInfo;
}

@property (nonatomic, retain) IBOutlet UILabel *gameInfo;

-(IBAction)selectTeam:(id)sender ;


@end
