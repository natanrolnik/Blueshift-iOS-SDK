//
//  BlueShiftUserInfo.h
//  BlueShift-iOS-SDK
//
//  Created by Arjun K P on 05/03/15.
//  Copyright (c) 2015 Bullfinch Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlueShiftUserInfo : NSObject


@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSDate *dateOfBirth;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSDate *joinedAt;
@property (nonatomic, strong) NSString *facebookID;
@property (nonatomic, strong) NSString *education;
@property BOOL unsubscribed;

@property NSDictionary *additionalUserInfo;
@property (nonatomic, strong) NSString *retailerCustomerID;

- (void)save;
+ (void)removeCurrentUserInfo;
+ (instancetype) sharedUserInfo;
- (NSDictionary *)toDictionary;

@end