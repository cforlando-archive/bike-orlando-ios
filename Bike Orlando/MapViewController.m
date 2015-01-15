//
//  MapViewController.m
//  Bike Orlando
//
//  Created by Andrew Kozlik on 1/11/15.
//  Copyright (c) 2015 Andrew Kozlik. All rights reserved.
//

#import "MapViewController.h"
#import "Feature.h"

@interface MapViewController ()

@property (nonatomic, retain) NSMutableArray *bikeRacksArray;
@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bikeRacksArray = [NSMutableArray new];
    
    
    
    [self loadBikeRacks];
    
    // Do any additional setup after loading the view.
}

-(void)loadBikeRacks {
    NSString *filename = [[NSBundle mainBundle] pathForResource:@"bike_parking" ofType:@"geojson"];
    NSData *data = [NSData dataWithContentsOfFile:filename];
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    NSArray *features = [json objectForKey:@"features"];
    
    [self.bikeRacksArray removeAllObjects];
    for (NSDictionary *featureDict in features) {
        Feature *feature = [[Feature alloc] initWithDictionary:featureDict];
        [self.bikeRacksArray addObject:feature];
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
