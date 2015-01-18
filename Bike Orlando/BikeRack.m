//
//  Feature.m
//  Bike Orlando
//
//  Created by Andrew Kozlik on 1/11/15.
//  Copyright (c) 2015 Andrew Kozlik. All rights reserved.
//

#import "BikeRack.h"
#import "NSString+CFO.h"

@implementation BikeRack

- (id)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    if (self) {
        self.coordinate = [self coordinateFromDictionary:[dict objectForKey:@"geometry"]];
        
        NSDictionary *descriptionDict = [self dictionaryFromDescriptionString:[[dict objectForKey:@"properties"] objectForKey:@"description"]];
        if ([descriptionDict objectForKey:@"Address"]) {
            self.addressString = [descriptionDict objectForKey:@"Address"];
        }
        
        if ([descriptionDict objectForKey:@"Capacity"]) {
            self.capacityCount = [[descriptionDict objectForKey:@"Address"] intValue];
        }
        
        if ([descriptionDict objectForKey:@"Num"]) {
            self.featureID = [[descriptionDict objectForKey:@"Num"] intValue];
        }
        
        if ([descriptionDict objectForKey:@"Ownership"]) {
            self.ownershipString = [descriptionDict objectForKey:@"Ownership"];
        }
    }
    
    return self;
}

- (CLLocationCoordinate2D)coordinateFromDictionary:(NSDictionary *)dict {

    CLLocationCoordinate2D coordinate;
    if ([[dict objectForKey:@"coordinates"] isKindOfClass:[NSArray class]]) {
        NSArray *coordinates = [dict objectForKey:@"coordinates"];
        coordinate = CLLocationCoordinate2DMake([coordinates[0] doubleValue], [coordinates[1] doubleValue]);
    }
    
    return coordinate;
}

- (NSDictionary *)dictionaryFromDescriptionString:(NSString *)string {

    NSString *fullDescription = [string stringBetweenString:@"<p>" andString:@"</p>"];
    
    NSMutableArray *stringLines = [NSMutableArray arrayWithArray:[fullDescription componentsSeparatedByString:@"\n<br />"]];
    
    if ([[stringLines objectAtIndex:0] isEqualToString:@""]) {
        [stringLines removeObjectAtIndex:0];
    }

    NSMutableDictionary *dict = [NSMutableDictionary new];
    for (NSString *stringLine in stringLines) {

        NSArray *components = [stringLine componentsSeparatedByString:@" = "];

        if ([components count] == 2) {
            [dict setObject:components[1] forKey:components[0]];
        }
    }
    
    return dict;
}

@end
