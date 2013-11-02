//
//  CircularImageView.m
//  iOSCustomControls
//
//  Created by Donovan Palma Jr on 10/30/2013.
//  Copyright (c) 2013 Donovan Palma. All rights reserved.
//

#import "CircularImageView.h"

@interface CircularImageView()

@property (nonatomic, strong, readonly) NSOperationQueue *imageQueue;

@end

@implementation CircularImageView

static NSInteger kDefaultBorderWidth = 4.0f;

@synthesize imageUrl = _imageUrl;
@synthesize imageQueue = _imageQueue;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]){
        return self;
    }
    
    return nil;
}

-(void)awakeFromNib{
    _borderWidth = kDefaultBorderWidth;
}

-(NSOperationQueue *)imageQueue{
    if (!_imageQueue){
        _imageQueue = [[NSOperationQueue alloc]init];
    }
    return _imageQueue;
    
}

-(NSURL *)imageUrl{
    return _imageUrl;
}

-(void)setImageUrl:(NSURL *)imageUrl{
    _imageUrl = imageUrl;
    NSURLRequest *request = [NSURLRequest requestWithURL:_imageUrl];
    
    [NSURLConnection sendAsynchronousRequest:request queue:self.imageQueue completionHandler:^(NSURLResponse *repsonse, NSData *data, NSError *connectionError){
        
        dispatch_async(dispatch_get_main_queue(), ^(){
            self.image = [UIImage imageWithData:data];
        });
    }];

}

-(void)willMoveToSuperview:(UIView *)newSuperview{
    //generate mask that will be applied to imageView
    


    CALayer *maskLayer = [[CALayer alloc]init];
    maskLayer.frame = CGRectMake(0, 0, self.frame.size.width,self.frame.size.height);
    
    maskLayer.cornerRadius = self.frame.size.height/2;
    
    [maskLayer setBackgroundColor:[UIColor redColor].CGColor];
    
    //generate shape that will be added to imageView
    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.fillColor = NULL;
    CGColorRef borderColor = [self.delegate getBorderColor];
    
    mask.strokeColor = borderColor == NULL ? [UIColor redColor].CGColor: borderColor;
    
    float borderWidth = [self.delegate getBorderWidth];
    
    mask.lineWidth = borderWidth <= 0 ? kDefaultBorderWidth:borderWidth;
    
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
