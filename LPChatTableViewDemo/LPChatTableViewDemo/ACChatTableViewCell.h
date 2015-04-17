//
//  ACChatTableViewCell.h
//  AChatSoftWare
//
//  Created by lipeng on 17/4/15.
//  Copyright (c) 2015年 lipeng. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ACChatViewController.h"
//#import "ACSingleDetailViewController.h"
#import "UIViewExt.h"
#import "GlobalObject.h"
#import "LPTextSizeHelper.h"

@interface ACChatTableViewCell : UITableViewCell


@property (strong, nonatomic) UIImageView *avatarImageView;
@property (strong, nonatomic) UIImageView *bubbleImageView;
//@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UILabel *nickLabel;//我在群中的昵称

@property (nonatomic, strong) UITapGestureRecognizer *avatarTap;
@property (nonatomic, strong) UITextView *contentTextView;

@property (nonatomic, strong) NSDictionary *dicMessage;

@property (nonatomic, strong) LPTextSizeHelper *helper;
@end
