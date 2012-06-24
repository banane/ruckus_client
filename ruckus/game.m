//
//  game.m
//  ruckus
//
//  Created by Anna Billstrom on 6/23/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//

#import "game.h"
#import "shout.h"
#import "ruckusAppDelegate.h"

@implementation game
@synthesize gameInfo;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)selectTeam:(id)sender{
    ruckusAppDelegate *app = (ruckusAppDelegate *)[[UIApplication sharedApplication] delegate];

    // set skins
    /// change before going live
    NSArray *teams = [[NSArray alloc] initWithObjects:@"nyn",@"nya",nil];
    app.team = [teams objectAtIndex:[sender tag]];
    if([app.team isEqualToString:@"nyn"]){
        app.selectedHead = [UIImage imageNamed:@"mets_head.png"];
    }
    if([app.team isEqualToString:@"nya"]){
        app.selectedHead = [UIImage imageNamed:@"yankees_head.png"];
    }
    
    shout *sh = [[shout alloc] initWithNibName:@"shout" bundle:nil];
    [[self navigationController] pushViewController:sh animated:YES];
    [sh release];
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

@end
