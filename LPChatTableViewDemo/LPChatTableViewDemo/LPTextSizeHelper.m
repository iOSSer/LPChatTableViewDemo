//
//  LPTextSizeHelper.m
//  LPChatTableViewDemo
//
//  Created by lipeng on 15/4/17.
//  Copyright (c) 2015年 lipeng. All rights reserved.
//

#import "LPTextSizeHelper.h"

@implementation LPTextSizeHelper

static CGFloat avatarWidth = 34;//头像宽度

- (void)setMessageObject:(id)messageObject
{
    _messageObject = messageObject;
    NSDictionary *dicMessage = messageObject;
//    NSString *text = [dicMessage objectForKey:@"msgContent"];
    _MaxWidth = [UIScreen mainScreen].bounds.size.width - (10 * 2 + avatarWidth * 2);
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, _MaxWidth, 40)];
    textView.attributedText = [dicMessage objectForKey:@"msgContent"];//[[NSAttributedString alloc] initWithAttributedString:[dicMessage objectForKey:@"msgContent"]];//[GlobalObject attributedStringWithText:text];
    CGSize textViewSize = [textView sizeThatFits:CGSizeMake(textView.bounds.size.width, 5000)];
    textView = nil;
    _contentSize = textViewSize;
}

@end
