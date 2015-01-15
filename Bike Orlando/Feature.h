//
//  Feature.h
//  Bike Orlando
//
//  Created by Andrew Kozlik on 1/11/15.
//  Copyright (c) 2015 Andrew Kozlik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef enum {
    kHitch
} BikeRackType;


@interface Feature : NSObject

@property CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSString *addressString;
@property (nonatomic, retain) NSString *generalLocationString;
@property (nonatomic, retain) NSString *ownershipString;
@property int capacityCount;
@property int featureID;
@property BikeRackType bikeRackType;

-(id)initWithDictionary:(NSDictionary *)dict;

@end
