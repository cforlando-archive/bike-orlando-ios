//
//  BikePath.m
//  Bike Orlando
//
//  Created by Andrew Kozlik on 1/15/15.
//  Copyright (c) 2015 Andrew Kozlik. All rights reserved.
//

#import "BikePath.h"
#import <CoreLocation/CoreLocation.h>

@implementation BikePath

-(id)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    if (self) {
        self.coordinates = [self coordinatesFromGeometry:[dict objectForKey:@"geometry"]];
    }
    
    return self;
}

-(NSArray *)coordinatesFromGeometry:(NSDictionary *)geoCoordinates {
    NSMutableArray *arr = [NSMutableArray new];
    
    NSArray *coords = (NSArray *)[geoCoordinates objectForKey:@"coordinates"];

    NSLog(@"%@", coords);
    for (NSArray *coordArray in coords) {
        NSLog(@"%@", coordArray);
        if ([coordArray count] > 1) {
            double lat = [coordArray[1] doubleValue];
            double lng = [coordArray[0] doubleValue];
//            CLLocation *location = [[CLLocation alloc] initWithLatitude:[coordArray[1] doubleValue] longitude:[coordArray[0] doubleValue]];
//            [arr addObject:location];
        }
    }
    
    return [NSArray arrayWithArray:arr];
}

@end
