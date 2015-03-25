//
//  BlueShiftProduct.m
//  BlueShift-iOS-SDK
//
//  Created by Arjun K P on 05/03/15.
//  Copyright (c) 2015 Bullfinch Software. All rights reserved.
//

#import "BlueShiftProduct.h"

@implementation BlueShiftProduct

- (NSDictionary *)toDictionary {
    NSMutableDictionary *productMutableDictionary = [NSMutableDictionary dictionary];
    if (self.sku) {
        [productMutableDictionary setObject:self.sku forKey:@"sku"];
    }
    
    if (self.quantity) {
        [productMutableDictionary setObject:[NSNumber numberWithInteger:self.quantity] forKey:@"quantity"];
    }
    
    if (self.price) {
        [productMutableDictionary setObject:[NSNumber numberWithFloat:self.price] forKey:@"price"];
    }
    
    return [productMutableDictionary copy];
}

+ (NSMutableArray *)productsDictionaryMutableArrayForProductsArray:(NSArray *)productsArray {
    
    NSMutableArray *productsMutableArray = [NSMutableArray array];
    for (BlueShiftProduct *product in productsArray) {
        NSDictionary *productDictionary = [product toDictionary];
        [productsMutableArray addObject:productDictionary];
    }
    return productsMutableArray;
}

@end
