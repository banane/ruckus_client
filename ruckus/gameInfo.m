//
//  gameInfo.m
//  ruckus
//
//  Created by Anna Billstrom on 6/24/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//

#import "gameInfo.h"
#import "ruckusAppDelegate.h"
#import "choose.h"

@implementation gameInfo

@synthesize topRuckusTV,inningL,battingL,pitcherL,playTV,scoreL,head;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(IBAction)viewChoose{
    choose *cvc = [[choose alloc] initWithNibName:@"choose" bundle:nil];
    [[self navigationController] pushViewController:cvc animated:YES];
    [cvc release];
}

- (void)viewDidLoad
{
    ruckusAppDelegate *app = (ruckusAppDelegate *)[[UIApplication sharedApplication] delegate];
    self.topRuckusTV.text = [[app.topReactionsDict objectForKey:@"reaction1"] objectForKey:@"content"];
    
    self.inningL.text = app.inning;
    self.battingL.text = [app.gameDict objectForKey:@"current_batter"];
    self.pitcherL.text = [app.gameDict objectForKey:@"current_pitcher"];
    self.playTV.text = [app.gameDict objectForKey:@"last_play"];
    self.scoreL.text = [app.gameDict objectForKey:@"score"];
    self.head.image = app.selectedHead;

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)dealloc{
    [topRuckusTV release];
    [inningL release];
    [battingL release];
    [pitcherL release];
    [playTV release];
    [scoreL  release];
    [head release];

    [super dealloc];
}

@end
