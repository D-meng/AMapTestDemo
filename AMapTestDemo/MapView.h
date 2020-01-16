//
//  MapView.h
//  ing
//
//  Created by Mac-Mini-zhangli on 2017/5/18.
//  Copyright © 2017年 . All rights reserved.
//

#import <MAMapKit/MAMapKit.h>

@interface MapView : MAMapView
@property (nonatomic,strong) MAPolyline          *polyline;
@property (strong,nonatomic) MAAnnotationView           *userLocationAnnotationView;
@property (strong,nonatomic) MATileOverlay          *customOverlay;
@property (strong,nonatomic) CLLocation                 *startLoc,*endLoc;
@property (nonatomic, strong) CLLocation *location;

@end
