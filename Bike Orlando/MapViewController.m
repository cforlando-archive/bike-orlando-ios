//
//  MapViewController.m
//  Bike Orlando
//
//  Created by Andrew Kozlik on 1/11/15.
//  Copyright (c) 2015 Andrew Kozlik. All rights reserved.
//

#import "MapViewController.h"
#import "BikeRack.h"
#import "BikePath.h"

@interface MapViewController ()

@property (nonatomic, retain) NSMutableArray *bikeRacksArray;
@end

@implementation MapViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"Bike Orlando";
    
    self.bikeRacksArray = [NSMutableArray new];
    
    [self loadBikeRacks];
    [self loadBikePaths];
    
    // Build out the quad tree using the feature (bike rack) models

    [self.coordinateQuadTree buildTreeWithBikeRacks:self.bikeRacksArray];
    
    [self.mapView setRegion:MKCoordinateRegionMake(CLLocationCoordinate2DMake(28.521419, -81.385143), MKCoordinateSpanMake(.5, .5))];
}

-(void)loadBikeRacks {
    
    // Load our bike racks JSON and get the array of 'features'
    NSString *filename = [[NSBundle mainBundle] pathForResource:@"bike_parking" ofType:@"geojson"];
    NSData *data = [NSData dataWithContentsOfFile:filename];
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    NSArray *features = [json objectForKey:@"features"];
    
    // Build out array of bike racks from JSON
    [self.bikeRacksArray removeAllObjects];
    for (NSDictionary *featureDict in features) {
        BikeRack *feature = [[BikeRack alloc] initWithDictionary:featureDict];
        [self.bikeRacksArray addObject:feature];
    }
}

-(void)loadBikePaths {
    NSString *filename = [[NSBundle mainBundle] pathForResource:@"bike_lanes" ofType:@"geojson"];
    NSData *data = [NSData dataWithContentsOfFile:filename];
    NSError *error;
    
    NSDictionary *json;
    
    if ((json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error])) {
        NSArray *paths = [json objectForKey:@"features"];
        
        for (NSDictionary *pathDict in paths) {
            BikePath *path = [[BikePath alloc] initWithDictionary:pathDict];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
