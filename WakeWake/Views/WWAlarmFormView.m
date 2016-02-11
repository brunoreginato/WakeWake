//
//  WWAlarmFormView.m
//  WakeWake
//
//  Created by Bruno Isola Reginato on 8/1/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//

#import "WWAlarmFormView.h"
#import "UIColor+WWColor.h"

@interface WWAlarmFormView()
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UISlider *sldRadius;

@property (strong,nonatomic) MKCircle *radiusCircle;
@property (strong,nonatomic) MKPointAnnotation *point;

@end
@implementation WWAlarmFormView

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];

    [self setupSliderRadius];
    [self setupMapLongPress];
}

-(void)fillWithAlarm:(WWAlarm *)alarm {
    [_sldRadius setValue:alarm.radius.doubleValue animated:YES];
    _txtName.text = alarm.name;
    self.mapView.delegate = self;
    
    if (alarm.latitude != nil && alarm.longitude != nil) {
        CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(alarm.latitude.doubleValue, alarm.longitude.doubleValue);
        
        [self addAnnotationToLocationCoordinate: coord];
        
        //zooming
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(coord, alarm.radius.doubleValue, alarm.radius.doubleValue);
        MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:viewRegion];
        [self.mapView setRegion:adjustedRegion animated:YES];
    }
    else {
        self.mapView.showsUserLocation = YES;
    }
}

-(void)setValuesToAlarm:(WWAlarm *)alarm {
    alarm.name = _txtName.text;
    alarm.radius = [NSNumber numberWithDouble:_sldRadius.value];
    
    if (self.point != nil) {
        alarm.longitude = @(self.point.coordinate.longitude);
        alarm.latitude = @(self.point.coordinate.latitude);
    }
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    [self addCircleOverlayToMap];
}

- (void)addCircleOverlayToMap {
    if(self.radiusCircle != nil) {
        [self.mapView removeOverlay: self.radiusCircle];
    }
    
    if (self.point != nil) {
        self.radiusCircle = [MKCircle circleWithCenterCoordinate:self.point.coordinate radius:self.sldRadius.value];
        self.radiusCircle.title = @"Circle1";
        
        [self.mapView addOverlay: self.radiusCircle];
    }
}

#pragma mark - SliderRadius UI setups
-(void)setupSliderRadius {
    [_sldRadius addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [_sldRadius setThumbImage:[_sldRadius thumbImageForState:UIControlStateNormal] forState:UIControlStateNormal];
    _sldRadius.thumbTintColor = [UIColor WWaqua];
}

#pragma mark - MKMapViewDelegate
-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    if ([overlay isKindOfClass:[MKCircle class]])
    {
        MKCircleRenderer* aRenderer = [[MKCircleRenderer alloc] initWithCircle:(MKCircle *)overlay];
        
        aRenderer.fillColor = [[UIColor cyanColor] colorWithAlphaComponent:0.2];
        aRenderer.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.7];
        aRenderer.lineWidth = 3;
        
        return aRenderer;
    }else{
        return nil;
    }
}

-(void)setupMapLongPress {
    UILongPressGestureRecognizer* lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 1.5;
    
    [self.mapView addGestureRecognizer:lpgr];
}

- (void) handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        CLLocationCoordinate2D coordinate = [self.mapView convertPoint:[gestureRecognizer locationInView:self.mapView] toCoordinateFromView:self.mapView];
        
        [self addAnnotationToLocationCoordinate:coordinate];
    }
}

-(void) addAnnotationToLocationCoordinate:(CLLocationCoordinate2D)coordinate {
    [self.mapView removeAnnotations: self.mapView.annotations];
    
    self.point = [[MKPointAnnotation alloc] init];
    self.point.coordinate = coordinate;
    
    [self.mapView setCenterCoordinate:coordinate animated:NO];
    [self.mapView addAnnotation: self.point];
    
    [self addCircleOverlayToMap];
}

@end
