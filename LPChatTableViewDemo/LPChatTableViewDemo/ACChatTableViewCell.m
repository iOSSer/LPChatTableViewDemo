//
//  ACChatTableViewCell.m
//  AChatSoftWare
//
//  Created by lipeng on 17/4/15.
//  Copyright (c) 2015年 lipeng. All rights reserved.
//

#import "ACChatTableViewCell.h"

@implementation ACChatTableViewCell

static CGFloat avatarWidth = 34;
//static CGFloat cellDefaultHeight = 113;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubviews];
    }
    return self;
}


- (void) initSubviews
{
    self.backgroundColor = [UIColor clearColor];
    
    self.dateLabel = [[UILabel alloc] init];
    self.dateLabel.frame = CGRectMake(0, 5, self.bounds.size.width, 20);
    self.dateLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.dateLabel];
    self.dateLabel.font = [UIFont systemFontOfSize:14.f];
    self.dateLabel.textAlignment = NSTextAlignmentCenter;
    self.dateLabel.textColor = [UIColor grayColor];
    self.dateLabel.text = @"2018年4月3日 9:00";
    
    self.avatarImageView = [[UIImageView alloc] init];
    self.avatarImageView.frame = CGRectMake(10, self.dateLabel.bottom + 10, avatarWidth, avatarWidth);
    [self.avatarImageView setImage:[UIImage imageNamed:@"chat_user"]];
    [self.contentView addSubview:self.avatarImageView];
    
    self.nickLabel = [[UILabel alloc] init];
    self.nickLabel.frame = CGRectMake(self.avatarImageView.right + 5, self.avatarImageView.top - 5, self.bounds.size.width - (10 * 2 + avatarWidth * 2), 20);
    self.nickLabel.textAlignment = NSTextAlignmentLeft;
    self.nickLabel.text = @"群主-易大师";
    self.nickLabel.font = [UIFont systemFontOfSize:12.f];
    self.nickLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.nickLabel];
    
    CGFloat maxWidth = self.bounds.size.width - (10 * 2 + avatarWidth * 2);
    
    self.bubbleImageView = [[UIImageView alloc] init];
    self.bubbleImageView.frame = CGRectMake(self.avatarImageView.right + 5, 0, self.width, 0);
    self.bubbleImageView.userInteractionEnabled = YES;
    [self.contentView addSubview:self.bubbleImageView];
    
    
    self.contentTextView = [[UITextView alloc] init];
    self.contentTextView.frame = CGRectMake(0, 0, maxWidth, 40);
    self.contentTextView.font = [UIFont systemFontOfSize:17.f];
    self.contentTextView.backgroundColor = [UIColor clearColor];
    self.contentTextView.editable = NO;
    self.contentTextView.selectable = NO;
    self.contentTextView.left = 5;
    self.contentTextView.width = self.bubbleImageView.bounds.size.width - 10;
//    self.contentTextView.scrollEnabled = NO;
    self.contentTextView.userInteractionEnabled = NO;
    [self.bubbleImageView addSubview:self.contentTextView];
    
    self.dateLabel.hidden = YES;
    self.avatarImageView.hidden = YES;
    self.nickLabel.hidden = YES;
}


- (void)awakeFromNib {
    _avatarTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(AvatarTapped:)];
    [_avatarImageView addGestureRecognizer:_avatarTap];
//    UIImage *bubbleImage = [UIImage imageNamed:@"bubble_left"];
//    _bubbleImageView.image = [ACViewHelper resizableImage:bubbleImage];
    
//    self.contentTextView = [[UITextView alloc] initWithFrame:_bubbleImageView.bounds];
//    self.contentTextView.editable = NO;
//    self.contentTextView.selectable = NO;
//    self.contentTextView.scrollEnabled = NO;
//    NSLog(@"%@", _contentTextView.font);
//    self.contentTextView.left = 5;
//    self.contentTextView.backgroundColor = [UIColor clearColor];
//    [_bubbleImageView addSubview:self.contentTextView];
//    self.contentTextView.font = [UIFont systemFontOfSize:17.f];
    _bubbleImageView.height = 300;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark 头像点击
- (void)AvatarTapped:(id)sender {


}
//
//- (void)setDicMessage:(NSDictionary *)dicMessage
//{
//    _dicMessage = dicMessage;
////    [self initContents];
//}

//- (void) initContents
//{
//    return;
//    
//    CGFloat maginX = self.bounds.size.width - (10 * 2 + avatarWidth * 2);
//    
//    NSString *text = [_dicMessage objectForKey:@"msgContent"];
//    _contentTextView.attributedText = [GlobalObject attributedStringWithText:text];
//    CGRect textBound = [_contentTextView.attributedText boundingRectWithSize:CGSizeMake(150, 1000) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
//    _contentTextView.font = [UIFont systemFontOfSize:15];
////    float height = textBound.size.height + 60 + 151;
////    _bubbleImageView.left = 0;
//    CGFloat width = textBound.size.width + _bubbleImageView.frame.origin.x > maginX ? maginX : textBound.size.width + _bubbleImageView.frame.origin.x;
////    CGFloat height = textBound.size.height + _bubbleImageView.frame.origin.y > self.bounds.size.height - _bubbleImageView.frame.origin.y - 10 ? textBound.size.height + _bubbleImageView.frame.origin.y : textBound.size.height + 10;
//    
////    CGFloat height = textBound.size.height + _bubbleImageView.frame.origin.y
//    CGFloat height = textBound.size.height + _bubbleImageView.frame.origin.y;
////    if (textBound.size.height <= 25) {
////        height = 35;
////    }else if (textBound.size.height <= 50 && textBound.size.height > 25)
////    {
////        height = 40;
////    }else if (textBound.size.height <= 75 && textBound.size.height > 50)
////    {
////        height = height - 10;
////    }else
////    {
//////        height = height + 10;
////    }
//    
////    height =[[self.contentTextView layoutManager]usedRectForTextContainer:[self.contentTextView textContainer]].size.height;
//    
////    height = [self heightForTextView:_contentTextView WithText:text];
////    height = textFrame.size.height;
//    
////    else
////    {
////        height = height + 45;
////    }
//    
////    if (textBound.size.height <= 25.0) {
////        height = 40;
////    }
////    NSLog(@"height:%f", textBound.size.height);
////    if (height < cellDefaultHeight) {
////        NSLog(@"height < cellDefaultHeight");
////        height =  (25 + 1) * (textBound.size.height / 25) + 18 * (textBound.size.height / 25);
////    }
////    CGRect textFrame=[[self.contentTextView layoutManager]usedRectForTextContainer:[self.contentTextView textContainer]];
////    height = textFrame.size.height + _bubbleImageView.top;
////    if (textBound.size.height > cellDefaultHeight) {
////        height = height + 50;
////    }
////    NSLog(@"y:%f", _bubbleImageView.frame.origin.y);
//    _bubbleImageView.size = CGSizeMake(width, height);
//    _contentTextView.height = height;
////    _bubbleImageView.backgroundColor = [UIColor clearColor];
////    _contentTextView.height = _bubbleImageView.height;
//    UIImage *bubbleImage = [UIImage imageNamed:@"bubble_left"];
//    _bubbleImageView.image = [ACViewHelper resizableImage:bubbleImage];
//}

//- (float) heightForTextView: (UITextView *)textView WithText: (NSString *) strText{
//    float fPadding = 16.0; // 8.0px x 2
//    CGSize constraint = CGSizeMake(textView.contentSize.width - fPadding, CGFLOAT_MAX);
//    
//    CGSize size = [strText sizeWithFont: textView.font constrainedToSize:constraint lineBreakMode:NSLineBreakByCharWrapping];
//    
//    float fHeight = size.height + 16.0;
//    
//    return fHeight;
//}


- (void)setHelper:(LPTextSizeHelper *)helper
{
    _helper = helper;
    
//    CGFloat maxWidth = self.bounds.size.width - (10 * 2 + avatarWidth * 2);
//
//    if (!_bubbleImageView) {
//        self.bubbleImageView = [[UIImageView alloc] init];
//        self.bubbleImageView.frame = CGRectMake(self.avatarImageView.right + 5, 0, maxWidth, 0);
//        self.bubbleImageView.userInteractionEnabled = YES;
//        [self.contentView addSubview:self.bubbleImageView];
//        
//        self.contentTextView = [[UITextView alloc] init];
//        self.contentTextView.frame = CGRectMake(0, 0, maxWidth, 40);
//        self.contentTextView.font = [UIFont systemFontOfSize:17.f];
//        self.contentTextView.backgroundColor = [UIColor clearColor];
//        self.contentTextView.editable = NO;
//        self.contentTextView.selectable = NO;
//        self.contentTextView.left = 5;
//        self.contentTextView.width = self.bubbleImageView.bounds.size.width - 10;
//        //    self.contentTextView.scrollEnabled = NO;
//        self.contentTextView.userInteractionEnabled = NO;
//        [self.bubbleImageView addSubview:self.contentTextView];
//        
//        [self setNeedsLayout];
//        [self setNeedsDisplay];
//    }
    
    
    
    
    
//    CGFloat height = _helper.cellHeight;
//    _bubbleImageView.top = 0;
//    _bubbleImageView.height = self.height - 20;
//    _contentTextView.frame = _bubbleImageView.bounds;
//    _contentTextView.left = 5;
    NSDictionary *dicMessage = helper.messageObject;
    _contentTextView.attributedText = [dicMessage objectForKey:@"msgContent"];
//    NSString *text = [dicMessage objectForKey:@"msgContent"];
//    _contentTextView.attributedText = [GlobalObject attributedStringWithText:text];
////    _contentTextView.text = text;
//    _contentTextView.font = [UIFont systemFontOfSize:14.f];
    //[[NSAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.f]}]
//    CGFloat maxWidth = self.bounds.size.width - (10 * 2 + avatarWidth * 2);
    _bubbleImageView.left = 53;
    _bubbleImageView.width = _helper.contentSize.width + 5;
    _contentTextView.width = _helper.contentSize.width;
//    _contentTextView.width = maxWidth;
//
//    _contentTextView.backgroundColor = [UIColor orangeColor];

    _bubbleImageView.height = _helper.contentSize.height;
    _contentTextView.height = _bubbleImageView.height;
//    _contentTextView.attributedText = [GlobalObject attributedStringWithText:dicMessage[@"msgContent"]];
    UIImage *bubbleImage = [UIImage imageNamed:@"bubble_left"];
    _bubbleImageView.image = [self resizableImage:bubbleImage];
}

- (UIImage *)resizableImage:(UIImage *)image
{
    //default is 2
    CGFloat top = image.size.height / 5; // 顶端盖高度
    CGFloat bottom = image.size.height / 5 ; // 底端盖高度
    CGFloat left = image.size.width / 5; // 左端盖宽度
    CGFloat right = image.size.width / 5; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    // 指定为拉伸模式，伸缩后重新赋值
    return [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
}
@end
