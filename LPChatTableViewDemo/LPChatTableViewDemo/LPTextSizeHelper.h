//
//  LPTextSizeHelper.h
//  LPChatTableViewDemo
//
//  Created by lipeng on 15/4/17.
//  Copyright (c) 2015年 lipeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

#import "GlobalObject.h"
@interface LPTextSizeHelper : NSObject

@property (nonatomic, assign) CGFloat MaxWidth;

@property (nonatomic, strong) id messageObject;

//@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, assign) CGSize contentSize;

@end
