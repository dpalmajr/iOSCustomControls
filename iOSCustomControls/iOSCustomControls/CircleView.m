//
//  CircleImageView.m
//  iOSCustomControls
//
//  Created by Donovan Palma on 2013-10-28.
//  Copyright (c) 2013 Donovan Palma. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

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
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    // Drawing code
    CGRect myRect = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //    UIGraphicsBeginImageContext(myRect.size);
    
    
    UIImage *image = [UIImage imageNamed:@"1338463987.jpg"];
    
    float newWidth = rect.size.height;
    float newHeight = newWidth/(image.size.width/image.size.height);
    
    CGRect newRect = CGRectMake(0, 0, newWidth, newHeight);
    
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetShouldAntialias(context, true);
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    
    CGContextSetFillColorWithColor(context, [UIColor orangeColor].CGColor);
    
    CGContextAddArc(context, newRect.size.width/2, newRect.size.height/2, (newRect.size.height/2), 0, 2*M_PI, 1);

    CGContextEOClip(context);
    CGContextSetFillColorWithColor(context, [UIColor purpleColor].CGColor);
    CGContextFillRect(context, self.bounds);

    CGContextAddArc(context, newRect.size.width/2, newRect.size.height/2, (newRect.size.height/2)-6, 0, 2*M_PI, 1);

    CGContextEOClip(context);

    CGContextSaveGState(context);

    CGContextRotateCTM(context,180*M_PI/180);
    CGContextTranslateCTM(context, newRect.size.width*-1, newRect.size.height*-1);
    CGContextDrawImage(context, newRect, image.CGImage);
    
    CGContextRestoreGState(context);
}


@end
