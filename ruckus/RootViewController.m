//
//  RootViewController.m
//  ruckus
//
//  Created by Anna Billstrom on 6/23/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//

#import "RootViewController.h"
#import "topShoutsAll.h"
#import "ruckusAppDelegate.h"

#define TOTALDURATION 3

@implementation RootViewController

@synthesize decibelLevel,rBtn,totalDecibels,head,speaker,animationArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    animationArray = [[NSArray alloc] initWithObjects:
                               [UIImage imageNamed:@"recording1_x1.png"],
                               [UIImage imageNamed:@"recording2_x1.png"],
                               [UIImage imageNamed:@"recording3_x1.png"],
                               [UIImage imageNamed:@"recording4_x1.png"], nil];

    
    ruckusAppDelegate *app = (ruckusAppDelegate *)[[UIApplication sharedApplication] delegate];
    self.head.image = app.selectedHead;
    
    totalDecibels = 0;
    
    NSArray *dirPaths;
    NSString *docsDir;
    
    dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    NSString *soundFilePath = [docsDir
                               stringByAppendingPathComponent:@"sound.caf"];
    
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    NSDictionary *recordSettings = [NSDictionary 
                                    dictionaryWithObjectsAndKeys:
                                    [NSNumber numberWithInt:AVAudioQualityMin], AVEncoderAudioQualityKey,
                                    [NSNumber numberWithInt:16], AVEncoderBitRateKey,
                                    [NSNumber numberWithInt: 2], AVNumberOfChannelsKey,
                                    [NSNumber numberWithFloat:44100.0], AVSampleRateKey,
                                    nil];
    
    NSError *error = nil;
    
    audioRecorder = [[AVAudioRecorder alloc]
                     initWithURL:soundFileURL
                     settings:recordSettings
                     error:&error];
    
    if (error)
    {
        NSLog(@"error: %@", [error localizedDescription]);
        
    } else {
        [audioRecorder prepareToRecord];
    }
}

-(IBAction)submitWeight{
    topShoutsAll *tsa = [[topShoutsAll alloc] initWithNibName:@"topShoutsAll" bundle:nil];
    [[self navigationController] pushViewController:tsa animated:YES];
    [tsa release];
}


-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder  successfully:(BOOL)flag
{
    NSLog(@"did end recording");
    NSLog(@"final count: %d",totalDecibels);
}
-(void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError *)error
{
    NSLog(@"Encode Error occurred");
}




-(IBAction)startRecording{
    rBtn.hidden = YES;
    
    NSError *error = nil;
   
    [audioRecorder prepareToRecord];
    audioRecorder.meteringEnabled = YES;
    //Start the actual Recording
    [audioRecorder recordForDuration:(NSTimeInterval)TOTALDURATION];
    [audioRecorder record];
   
    TimerUpdate = [NSTimer scheduledTimerWithTimeInterval:.2 
                                                            target:self selector:@selector(timerTask) userInfo:nil repeats:YES];

    
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


- (void) timerTask {
    [audioRecorder updateMeters];
    float level = [audioRecorder peakPowerForChannel:0];
    
    level += 160;
//    NSLog(@"level: %f",level);
    float db;
    if(level > 0){
    
        db = log10(level);
    } else {
        db = 0;
    }
//    NSLog(@"db: %f",db);
    
    
    /* show correct image */
    int image_num = lroundf(db *2);
//    NSLog(@"image_num %d",image_num);

    
//    NSLog(@"d: %d",image_num);
    if(image_num > 3){
        image_num = 3;
    }
    if(image_num < 0){
        image_num = 0;
    }
    self.speaker.image = [animationArray objectAtIndex:image_num];
    
    /* add to total */
    totalDecibels += db;

 //   NSLog(@"%f", db);

    if(!audioRecorder.recording)
    {
        [TimerUpdate invalidate];
//        TimerUpdate = nil;   
        [self submitWeight];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}



- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [decibelLevel release];
    [rBtn release];
    [animationArray release];
    [head release];
    [speaker release];
    [super dealloc];
}

@end
