//
//  topShoutsAll.m
//  ruckus
//
//  Created by Anna Billstrom on 6/23/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//

#import "topShoutsAll.h"
#import "ruckusAppDelegate.h"

@implementation topShoutsAll

@synthesize reaction1,reaction2,reaction3;

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
    ruckusAppDelegate *app = (ruckusAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    reaction1.text = [[app.topReactionsDict objectForKey:@"reaction1"] objectForKey:@"content"];
    reaction2.text = [[app.topReactionsDict objectForKey:@"reaction2"] objectForKey:@"content"];
    reaction3.text = [[app.topReactionsDict objectForKey:@"reaction3"] objectForKey:@"content"];
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
    [reaction1 release];
    [reaction2 release];
    [reaction3 release];
}

@end
