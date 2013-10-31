//
//  CircularImageView.m
//  iOSCustomControls
//
//  Created by Donovan Palma Jr on 10/30/2013.
//  Copyright (c) 2013 Donovan Palma. All rights reserved.
//

#import "CircularImageView.h"

@implementation CircularImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
////    [super drawRect:rect];
//    
//}

-(void)willMoveToSuperview:(UIView *)newSuperview{
    //generate mask that will be applied to imageView
    CALayer *maskLayer = [[CALayer alloc]init];
    maskLayer.frame = CGRectMake(0, 0, self.frame.size.width,self.frame.size.height);
    
    maskLayer.cornerRadius = self.frame.size.height/2;
    
    [maskLayer setBackgroundColor:[UIColor redColor].CGColor];
    
    //generate shape that will be added to imageView
    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.fillColor = NULL;
    mask.strokeColor = [UIColor orangeColor].CGColor;
    mask.lineWidth = 2.0f;
    mask.frame   = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, NULL, self.frame.size.width/2, self.frame.size.height/2, self.frame.size.height/2, 0, 2*M_PI, YES);
    mask.path = path;
    
    CGPathRelease(path);
    
    //add shape the imageView
    [self.layer addSublayer:mask];
    
    //apply mask to imageView just outside of the previous shape layer
    self.layer.mask = maskLayer;

}

@end
