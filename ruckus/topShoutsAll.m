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

@synthesize reaction1,reaction2,reaction3,head,inning;

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
    // kelsey's inning info
    
    ruckusAppDelegate *app = (ruckusAppDelegate *)[[UIApplication sharedApplication] delegate];
    self.head.image = app.selectedHead;
    
    reaction1.text = [[app.topReactionsDict objectForKey:@"reaction1"] objectForKey:@"content"];
    reaction2.text = [[app.topReactionsDict objectForKey:@"reaction2"] objectForKey:@"content"];
    reaction3.text = [[app.topReactionsDict objectForKey:@"reaction3"] objectForKey:@"content"];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"view did appear");
    [self performSelector:@selector(hideNavBar) withObject:nil afterDelay:0.0];
    
}

-(void) hideNavBar {
    if (self.navigationController.navigationBar.hidden == NO)
    {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
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
    [head release];
    [inning release];
    [super dealloc];
}

@end
