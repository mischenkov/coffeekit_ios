//
//  Venue.h
//  CoffeeKit
//
//  Created by Mischenkov Anatoly on 25/09/14.
//  Copyright (c) 2014 mischenkov.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Location, Stats;

@interface Venue : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) Location *location;
@property (nonatomic, strong) Stats *stats;
@end
