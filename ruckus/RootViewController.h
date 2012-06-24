//
//  RootViewController.h
//  ruckus
//
//  Created by Anna Billstrom on 6/23/12.
//  Copyright 2012 banane.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface RootViewController : UIViewController <AVAudioRecorderDelegate, AVAudioPlayerDelegate>{
    AVAudioRecorder *audioRecorder;
    AVAudioPlayer *audioPlayer;
    IBOutlet UIButton *rBtn;
    IBOutlet UILabel *decibelLevel;
    int totalDecibels;
    NSTimer *TimerUpdate;
    IBOutlet UIImageView *head;
}

@property (nonatomic, retain) IBOutlet UILabel *decibelLevel;
@property (nonatomic, retain) IBOutlet UIButton *rBtn;
@property (nonatomic) int totalDecibels;
@property (nonatomic, retain) IBOutlet UIImageView *head;

-(IBAction)startRecording;
-(void)timerTask;
-(IBAction)submitWeight;

@end
