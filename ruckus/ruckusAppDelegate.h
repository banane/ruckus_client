//
//  ruckusAppDelegate.h
//  ruckus
//
//  Created by Anna Billstrom on 6/23/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ruckusAppDelegate : NSObject <UIApplicationDelegate>{
    NSString *uid;
    NSString *currDate;
    NSDictionary *reactionsDict;
    NSString *team;
    NSDictionary *topReactionsDict;
    UIImage *selectedHead;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@property (nonatomic,retain) NSString *uid;
@property (nonatomic,retain) NSString *currDate;
@property (nonatomic, retain) NSDictionary *reactionsDict;
@property (nonatomic, retain) NSString *team;
@property (nonatomic, retain) NSDictionary *topReactionsDict;
@property (nonatomic, retain) UIImage *selectedHead;

-(void)doShoutUpload:(NSString *)shoutString;
-(void)getReactionsLurk;
-(void)doUpVotePost:(NSString *)reaction_id;
-(void)getTopReactions;
    
@end
