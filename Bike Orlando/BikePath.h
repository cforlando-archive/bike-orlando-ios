//
//  BikePath.h
//  Bike Orlando
//
//  Created by Andrew Kozlik on 1/15/15.
//  Copyright (c) 2015 Andrew Kozlik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BikePath : NSObject

@property (nonatomic, retain) NSArray *coordinates;
@property (nonatomic, retain) NSString *descriptionString;
@property (nonatomic, retain) NSString *typeString;
@property (nonatomic, retain) NSString *parkString;

-(id)initWithDictionary:(NSDictionary *)dict;

@end
