//
//  shout.m
//  ruckus
//
//  Created by Anna Billstrom on 6/23/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//

#import "shout.h"
#import "RootViewController.h"
#import "topShouts.h"

@implementation shout
@synthesize tf;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)submitText{
    // upload tf.text
    RootViewController *rvc = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
    [[self navigationController] pushViewController:rvc animated:YES];
    [rvc release];
    
}

-(IBAction)seeTopShouts{
    topShouts *ts = [[topShouts alloc] initWithNibName:@"topShouts" bundle:nil];
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
