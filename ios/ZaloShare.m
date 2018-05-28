//
//  ZaloShare.m
//  RNShare
//
//

#import "ZaloShare.h"

@implementation ZaloShare
- (void)shareSingle:(NSDictionary *)options
    failureCallback:(RCTResponseErrorBlock)failureCallback
    successCallback:(RCTResponseSenderBlock)successCallback {
    
    NSLog(@"Try open view");
    
    if ([options objectForKey:@"url"] && [options objectForKey:@"url"] != [NSNull null]) {
        NSString *url = [NSString stringWithFormat:@"zaloshareext://shareext?url=%@&type=8&version=1",options[@"url"]];
        
        NSURL *zaloURL = [NSURL URLWithString:url];
    
        [[UIApplication sharedApplication] openURL:zaloURL];
        successCallback(@[]);
    }
}


@end
