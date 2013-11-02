//
//  ViewController.m
//  iOSCustomControls
//
//  Created by Donovan Palma on 2013-10-28.
//  Copyright (c) 2013 Donovan Palma. All rights reserved.
//

#import "ViewController.h"
#import "CircularImageView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet CircularImageView *circleImageView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.circleImageView.imageUrl = [NSURL URLWithString:@"http://user.spot.konquest.com/user/522b4e79417c709c1c000001/picture"];
    [self.circleImageView setContentMode:UIViewContentModeScaleAspectFill];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CircularImageViewDelegate methods
-(CGColorRef)getBorderColor{
    return [UIColor greenColor].CGColor;
}

-(float)getBorderWidth{
    return 5.0f;
}

@end
