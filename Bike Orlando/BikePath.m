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
    for (NSArray *coordArray in coords) {
        if ([coordArray count] > 1) {
            
            CLLocation *location;
            
            if ([coordArray[0] respondsToSelector:@selector(doubleValue)]) {
                
                double lat = [coordArray[1] doubleValue];
                double lng = [coordArray[0] doubleValue];
                
                location = [[CLLocation alloc] initWithLatitude:lat longitude:lng];
                [arr addObject:location];
            } else {
                for (NSArray *array in coordArray) {
                    double lat = [array[1] doubleValue];
                    double lng = [array[0] doubleValue];
                    
                    location = [[CLLocation alloc] initWithLatitude:lat longitude:lng];
                    [arr addObject:location];
                }
            }
        }
    }
    
    return [NSArray arrayWithArray:arr];
}

@end
