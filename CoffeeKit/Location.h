//
//  Location.h
//  CoffeeKit
//
//  Created by Mischenkov Anatoly on 25/09/14.
//  Copyright (c) 2014 mischenkov.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *crossStreet;
@property (nonatomic, strong) NSString *postalCode;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *distance;
@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *lng;
@end
