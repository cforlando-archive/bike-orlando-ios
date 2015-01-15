//
//  TBMapViewController.h
//  TBAnnotationClustering
//
//  Created by Theodore Calmes on 9/27/13.
//  Copyright (c) 2013 Theodore Calmes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBCoordinateQuadTree.h"

@interface TBMapViewController : UIViewController

@property (strong, nonatomic) TBCoordinateQuadTree *coordinateQuadTree;
@property (strong, nonatomic) MKMapView *mapView;

@end
