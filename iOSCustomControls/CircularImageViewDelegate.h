//
//  CircularImageViewDelegate.h
//  iOSCustomControls
//
//  Created by Donovan Palma Jr on 11/2/2013.
//  Copyright (c) 2013 Donovan Palma. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CircularImageViewDelegate <NSObject>


-(CGColorRef)getBorderColor;
-(float)getBorderWidth;

@end
