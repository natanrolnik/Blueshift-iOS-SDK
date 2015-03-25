//
//  BlueShiftDeepLink.m
//  BlueShift-iOS-SDK
//
//  Created by Arjun K P on 25/02/15.
//  Copyright (c) 2015 Bullfinch Software. All rights reserved.
//

#import "BlueShiftDeepLink.h"

@implementation BlueShiftDeepLink

// Holds the list of deep links as static dictionary ... 
static NSDictionary *_deepLinkList = nil;

- (id)initWithLinkRoute:(BlueShiftDeepLinkRoute)linkRoute andNSURL:(NSURL *)pathURL {
    self = [super init];
    if (self) {
        self.linkRoute = linkRoute;
        self.pathURL = pathURL;
    }
    return self;
}

+ (void)mapDeepLink:(BlueShiftDeepLink *)deepLink toRoute:(BlueShiftDeepLinkRoute)linkRoute {
    // Map deeplink instance to a particular Route enum using static deeplink lists...
    
    NSMutableDictionary *deepLinkMutableList;
    NSNumber *linkRouteNumber = [NSNumber numberWithInt:linkRoute];
    if (_deepLinkList == nil) {
        deepLinkMutableList = [NSMutableDictionary dictionary];
    }
    else {
        deepLinkMutableList = [_deepLinkList mutableCopy];
    }
    [deepLinkMutableList setObject:deepLink forKey:linkRouteNumber];
    _deepLinkList = [deepLinkMutableList copy];
}

+ (BlueShiftDeepLink *)deepLinkForRoute:(BlueShiftDeepLinkRoute)linkRoute {
    // Get the deeplink instance for a particular Route enum ...
    
    NSNumber *linkRouteNumber = [NSNumber numberWithInt:linkRoute];
    BlueShiftDeepLink *deepLink;
    if (_deepLinkList == nil || [_deepLinkList count] < 1) {
        deepLink = nil;
    } else {
        deepLink = [_deepLinkList objectForKey:linkRouteNumber];
    }
    return deepLink;
}

- (BOOL)performDeepLinking {
    
    NSMutableArray *schemes = [NSMutableArray array];
    
    // Schemes are obtained from mainBundle ...
    // Need to be set by the developer in the host app in plist Of URLTypes...
    NSArray *bundleURLTypes = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleURLTypes"];
    [bundleURLTypes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [schemes addObjectsFromArray:[bundleURLTypes[idx] objectForKey:@"CFBundleURLSchemes"]];
    }];
    
    if (![schemes containsObject:[self.pathURL scheme]]) {
        return NO;
    }
    
    [self deepLinkToPath:[self.pathURL pathComponents]];
    
    return YES;
}


- (void)deepLinkToPath:(NSArray *)path {
    // Method to perform deeplink using the path components array ...
    
    // Get the current navigational controller and pop to the root view controller...
    UINavigationController *navController = (UINavigationController *)[[[UIApplication sharedApplication] delegate] window].rootViewController;
    [navController popToRootViewControllerAnimated:NO];
    
    // Get the current story board for the root view controller ...
    UIStoryboard *storyboard = [[[UIApplication sharedApplication] delegate] window].rootViewController.storyboard;
    
    NSMutableArray *viewControllers = [navController.viewControllers mutableCopy];
    for (NSString *storyboardID in path) {
        
        // Need to do a proper way to fetch valid view controllers here ...
        // Below is just a quick way ...
        if (![storyboardID isEqualToString:@"/"]) {
            [viewControllers addObject:[storyboard instantiateViewControllerWithIdentifier:storyboardID]];
        }
    }
    
    navController.viewControllers = viewControllers;
}

- (UIViewController *)lastViewController {
    // Get the last view controller in the view controller list ...
    
    UINavigationController *navController = (UINavigationController *)[[[UIApplication sharedApplication] delegate] window].rootViewController;
    return [navController.viewControllers lastObject];
}

- (UIViewController *)firstViewController {
    // Get the first view controller in view controller list ...
    
    UINavigationController *navController = (UINavigationController *)[[[UIApplication sharedApplication] delegate] window].rootViewController;
    return [navController.viewControllers firstObject];
}



@end