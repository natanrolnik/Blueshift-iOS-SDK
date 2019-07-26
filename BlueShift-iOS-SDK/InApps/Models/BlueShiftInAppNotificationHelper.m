//
//  BlueShiftInAppNotificationHelper.m
//  BlueShift-iOS-Extension-SDK
//
//  Created by shahas kp on 11/07/19.
//

#import "BlueShiftInAppNotificationHelper.h"

static NSDictionary *_inAppTypeDictionay;

@implementation BlueShiftInAppNotificationHelper

+ (void)load {
    _inAppTypeDictionay = @{
                        @"html": @(BlueShiftInAppTypeHTML),
                        @"center_popup": @(BlueShiftInAppTypeModal),
                        @"center_popup_with_image" : @(BlueShiftInAppModalWithImage),
                        @"slide_in_banner" : @(BlueShiftNotificationSlideBanner),
                        @"center_popup_one_button" :  @(BlueShiftNotificationOneButton)
                    };
}

+ (BlueShiftInAppType)inAppTypeFromString:(NSString*)inAppType {
    NSNumber *_inAppType = inAppType != nil ? _inAppTypeDictionay[inAppType] : @(BlueShiftInAppDefault);
    return [_inAppType integerValue];
}

@end
