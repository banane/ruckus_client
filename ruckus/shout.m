//
//  shout.m
//  ruckus
//
//  Created by Anna Billstrom on 6/23/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//

#import "shout.h"
#import "topShouts.h"
#import "topShoutsAll.h"
#import "ruckusAppDelegate.h"

@implementation shout
@synthesize tf,head,gameInfoTV;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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

-(IBAction)submitText{
    // upload tf.text
    ruckusAppDelegate *app = (ruckusAppDelegate *)[[UIApplication sharedApplication] delegate];
    [app doShoutUpload:tf.text];

    self.head.image = app.selectedHead;
    
    topShouts *ts = [[topShouts alloc] initWithNibName:@"topShouts" bundle:nil];
    [[self navigationController] pushViewController:ts animated:YES];
    [ts release];
    
}

-(IBAction)seeTopShouts{
    // send lurk
    ruckusAppDelegate *app = (ruckusAppDelegate *)[[UIApplication sharedApplication] delegate];
    [app getTopReactions]; // lurk
    
    topShoutsAll *ts = [[topShoutsAll alloc] initWithNibName:@"topShoutsAll" bundle:nil];
    [[self navigationController] pushViewController:ts animated:YES];
    [ts release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

# pragma mark - new word form methods
- (void)textFieldDidEndEditing:(UITextField *)textField{
    // notify server of new words
    //    [self setNewWord:textField];
    [textField resignFirstResponder];
}

- (BOOL) textFieldShouldReturn:(UITextField*)textField {
    [textField resignFirstResponder];
   // [self setNewWord:textField];
    return YES;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    ruckusAppDelegate *app = (ruckusAppDelegate *)[[UIApplication sharedApplication] delegate];
    // get gameinfo from Kelsey


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
    [super dealloc];
}

@end
