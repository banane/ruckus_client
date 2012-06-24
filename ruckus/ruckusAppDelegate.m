//
//  ruckusAppDelegate.m
//  ruckus
//
//  Created by Anna Billstrom on 6/23/12.
//  Copyright 2012 Momentus Media. All rights reserved.
//

#import "ruckusAppDelegate.h"
#import "JSONKit.h"

#define HEROKU_URL @"http://ruckus.herokuapp.com/mlb/"


@implementation ruckusAppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;
@synthesize uid,reactionsDict,team,currDate,topReactionsDict,selectedHead;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Add the navigation controller's view to the window and display.
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    self.uid = [[UIDevice currentDevice] uniqueIdentifier];

    NSDate *now = [NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    self.currDate = [format stringFromDate:now];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

-(void)doShoutUpload:(NSString *)shoutString{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@/%@/reaction/",HEROKU_URL,self.currDate, self.team]];
    
    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                    self.uid, @"user_id",
                                    @"string", @"reaction_type",
                                    shoutString,@"content",
                                    nil];
    
    NSString *jsonStringRequest = [jsonDictionary JSONString];
    
    NSLog(@"requestJson %@", jsonStringRequest);
    
    
    NSURLResponse *response;
    NSError *error;
    
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url 
                                                         cachePolicy:NSURLRequestReloadIgnoringCacheData    
                                                     timeoutInterval:30];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    
    [request setHTTPMethod:@"POST"];    
    [request setHTTPBody:[jsonStringRequest dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSString *responseDataString = (NSString *)[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"datastring: %@",responseDataString);
    
    self.reactionsDict = (NSDictionary *)[responseData objectFromJSONData];
    NSLog(@"reactions dict: %@", self.reactionsDict);
    
}

-(void)getReactionsLurk{
     NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@/%@/lurk?user_id=%@",HEROKU_URL,self.currDate, self.team, self.uid]];
    
    NSLog(@"the url: %@",url);
    
    NSURLResponse *response;
    NSError *error;
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url 
                                                         cachePolicy:NSURLRequestReloadIgnoringCacheData    
                                                     timeoutInterval:30];
    
    [request setHTTPMethod:@"GET"]; 
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

    NSString *responseDataString = (NSString *)[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"datastring: %@",responseDataString);
    self.reactionsDict = (NSDictionary *)[responseData objectFromJSONData];
    NSLog(@"reactions dict: %@", self.reactionsDict);

}

-(void)doUpVotePost:(NSString *)reaction_id{
    ///<date>/<team>/reaction_id/upvote?intensity=10&user_id=1231321321321
    
    NSLog(@"the reaction_id: %@",reaction_id);
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@/%@/%@/upvote?intensity=10&user_id=%@",HEROKU_URL,self.currDate, self.team,reaction_id, self.uid ]];
    
    
    NSLog(@"the url: %@",url);
    
    NSURLResponse *response;
    NSError *error;
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url 
                                                         cachePolicy:NSURLRequestReloadIgnoringCacheData    
                                                     timeoutInterval:30];
    
    [request setHTTPMethod:@"POST"]; 
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
}

-(void)getTopReactions{
    // DEFAULT VALUES
//    GET /<date>/<team>/top?inning=<inning>&number=<number of winners desired>&whose=<mine, theirs, or both>  
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@/%@/top?inning=&number=3&whose=",HEROKU_URL,self.currDate, self.team]];
    
    NSLog(@"the url: %@",url);
    
    NSURLResponse *response;
    NSError *error;
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url 
                                                         cachePolicy:NSURLRequestReloadIgnoringCacheData    
                                                     timeoutInterval:30];
    
    [request setHTTPMethod:@"GET"]; 
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSString *responseDataString = (NSString *)[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"datastring: %@",responseDataString);
    self.topReactionsDict = (NSDictionary *)[responseData objectFromJSONData];
    NSLog(@"reactions dict: %@", self.reactionsDict);   
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [uid release];
    [team release];
    [currDate release];
    [reactionsDict release];
    [topReactionsDict release];
    [selectedHead release];
    [super dealloc];
}

@end
