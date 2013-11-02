//
//  CircularImageView.h
//  iOSCustomControls
//
//  Created by Donovan Palma Jr on 10/30/2013.
//  Copyright (c) 2013 Donovan Palma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircularImageView : UIImageView

@property(nonatomic,strong) NSURL *imageUrl;
@property(nonatomic) float borderWidth;

@end
