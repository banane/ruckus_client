//
//  ruckusAppDelegate.h
//  ruckus
//
//  Created by Anna Billstrom on 6/23/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"

@interface ruckusAppDelegate : NSObject <UIApplicationDelegate,FBSessionDelegate>{
    NSString *uid;
    NSString *currDate;
    NSDictionary *reactionsDict;
    NSString *team;
    NSDictionary *topReactionsDict;
    UIImage *selectedHead;
    NSDictionary *gameDict;
    NSString *inning;
    Facebook *facebook;
    int totalDecibels;
    NSString *reaction_id;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@property (nonatomic,retain) NSString *uid;
@property (nonatomic,retain) NSString *currDate;
@property (nonatomic, retain) NSDictionary *reactionsDict;
@property (nonatomic, retain) NSString *team;
@property (nonatomic, retain) NSDictionary *topReactionsDict;
@property (nonatomic, retain) UIImage *selectedHead;
@property (nonatomic, retain) NSDictionary *gameDict;
@property (nonatomic, retain) NSString *inning;
@property (nonatomic, retain) Facebook *facebook;
@property (nonatomic) int totalDecibels;
@property (nonatomic, retain) NSString *reaction_id;

-(void)doShoutUpload:(NSString *)shoutString;
-(void)getReactionsLurk;
-(void)doUpVotePost;
-(void)getTopReactions;
-(void)getGameInfo;
    

-(void)doOpenGraphPush;

    
@end
