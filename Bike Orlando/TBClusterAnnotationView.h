//
//  TBClusterAnnotationView.h
//  TBAnnotationClustering
//
//  Created by Theodore Calmes on 10/4/13.
//  Copyright (c) 2013 Theodore Calmes. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface TBClusterAnnotationView : MKAnnotationView

@property (assign, nonatomic) NSUInteger count;
@property (strong, nonatomic) UILabel *countLabel;
@property (strong, nonatomic) UIColor *outerCircleStrokeColor;
@property (strong, nonatomic) UIColor *innerCircleStrokeColor;
@property (strong, nonatomic) UIColor *innerCircleFillColor;

@property float annotationWidth;
@property float annotationHeight;

@end
