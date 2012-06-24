//
//  choose.m
//  ruckus
//
//  Created by Anna Billstrom on 6/24/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//

#import "choose.h"
#import "shout.h"
#import "ruckusAppDelegate.h"

@implementation choose
@synthesize head;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)viewShout{
    shout *svc = [[shout alloc] initWithNibName:@"shout" bundle:nil];
    [[self navigationController] pushViewController:svc animated:YES];
    [svc release];
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
    ruckusAppDelegate *app = (ruckusAppDelegate *)[[UIApplication sharedApplication] delegate];
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

@end
