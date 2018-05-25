//
//  ZaloShare.m
//  RNShare
//
//  Created by Diseño Uno BBCL on 23-07-16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "ZaloShare.h"

@implementation ZaloShare
- (void)shareSingle:(NSDictionary *)options
    failureCallback:(RCTResponseErrorBlock)failureCallback
    successCallback:(RCTResponseSenderBlock)successCallback {
    
    NSLog(@"Try open view");
    
    if ([options objectForKey:@"message"] && [options objectForKey:@"message"] != [NSNull null]) {
        
        NSString * urlWhats = [NSString stringWithFormat:@"zalo://login"];
        NSURL * whatsappURL = [NSURL URLWithString:urlWhats];
        
        if ([[UIApplication sharedApplication] canOpenURL: whatsappURL]) {
            [[UIApplication sharedApplication] openURL: whatsappURL];
            successCallback(@[]);
        } else {
            // Cannot open whatsapp
            NSString *stringURL = @"zalo://login";
            NSURL *url = [NSURL URLWithString:stringURL];
            [[UIApplication sharedApplication] openURL:url];
            
            NSString *errorMessage = @"Not installed";
            NSDictionary *userInfo = @{NSLocalizedFailureReasonErrorKey: NSLocalizedString(errorMessage, nil)};
            NSError *error = [NSError errorWithDomain:@"com.rnshare" code:1 userInfo:userInfo];
            
            NSLog(errorMessage);
            failureCallback(error);
        }
    }
    
}


@end
