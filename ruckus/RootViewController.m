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

@synthesize decibelLevel,rBtn,totalDecibels,head;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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


- (void) timerTask {
    [audioRecorder updateMeters];
    float level = [audioRecorder peakPowerForChannel:0] + 160; // offset
    totalDecibels += level;
    decibelLevel.text = [NSString stringWithFormat:@"%d",totalDecibels];
    NSLog(@"%f", level);
    if(!audioRecorder.recording)
    {
        [TimerUpdate invalidate];
//        TimerUpdate = nil;   
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
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
    [head release];
    [super dealloc];
}

@end
