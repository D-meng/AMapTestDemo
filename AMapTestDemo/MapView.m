//
//  MapView.m
//  ing
//
//  Created by Mac-Mini-zhangli on 2017/5/18.
//  Copyright © 2017年 . All rights reserved.
//

#import "MapView.h"

#define kTileOverlayRemoteServerTemplate @"http://mt0.google.cn/vt/lyrs=y@258000000&hl=zh-CN&gl=cn&s=Galil&x={x}&y={y}&z={z}&&scale={scale}"

#define kTileOverlayRemoteMinZ 5
#define kTileOverlayRemoteMaxZ 20

@interface MapView ()<MAMapViewDelegate>

@end

@implementation MapView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.rotateCameraEnabled = NO;
        self.maxZoomLevel = 19;
        self.minZoomLevel = 5;
//        self.zoomLevel = 15;
        [self addOverlay:[self constructTileOverlay] level:0];
        self.rotateEnabled = NO;
        self.showsCompass = NO;
        self.showsScale = NO;
        self.mapType = MAMapTypeStandard;
    }
    return self;
}

- (MATileOverlay *)constructTileOverlay
{
    MATileOverlay *tileOverlay = [[MATileOverlay alloc] initWithURLTemplate:kTileOverlayRemoteServerTemplate];
    tileOverlay.minimumZ = kTileOverlayRemoteMinZ;
    tileOverlay.maximumZ = kTileOverlayRemoteMaxZ;
    tileOverlay.boundingMapRect = MAMapRectWorld;
    return tileOverlay;
}

#pragma mark -
#pragma mark - MAMapDelegate
- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay
{
    if ([overlay isKindOfClass:[MATileOverlay class]]) {
        MATileOverlayRenderer *renderer = [[MATileOverlayRenderer alloc] initWithTileOverlay:(MATileOverlay *)overlay];
        return renderer;
    }
    
    return nil;
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation {
    return nil;
}

@end
