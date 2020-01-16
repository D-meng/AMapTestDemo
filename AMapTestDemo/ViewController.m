//
//  ViewController.m
//  AMapTestDemo
//
//  Created by Dmeng on 2020/1/16.
//  Copyright © 2020 Dmeng. All rights reserved.
//

#import "MapView.h"
#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) MapView *map;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MapView *map = [[MapView alloc] initWithFrame: [UIScreen mainScreen].bounds];
    self.map = map;
    [self.view addSubview:map];
}


@end
