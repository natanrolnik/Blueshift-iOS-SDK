//
//  BlueshiftInAppNotificationRequest.h
//  BlueShift-iOS-Extension-SDK
//
//  Created by Noufal on 29/10/19.
//

#import <Foundation/Foundation.h>
#import "BlueShiftRequestOperationManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface BlueshiftInAppNotificationRequest : NSObject

+ (void) fetchInAppNotificationWithSuccess:(void (^)(NSDictionary*))success failure:(void (^)(NSError*))failure;

@end

NS_ASSUME_NONNULL_END
