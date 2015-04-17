//
//  GlobalObject.m
//  EChat
//
//  Created by pg on 14-10-11.
//  Copyright (c) 2014年 lipeng. All rights reserved.
//
#define DefaultViewRadius 10
#import "GlobalObject.h"

@implementation GlobalObject

//+ (void)setRadiusWithView:(UIView *)view
//{
//    view.layer.cornerRadius = DefaultViewRadius;
//    view.layer.masksToBounds = YES;
//}
//+ (void)setRadiusWithView:(UIView *)view value:(CGFloat)value
//{
//    view.layer.cornerRadius = value;
//    view.layer.masksToBounds = YES;
//}

+ (NSAttributedString *) attributedStringWithText:(NSString *)str
{
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    
    NSArray *arrEmoji = [GlobalObject getEmojiArray];
    //正则匹配要替换的文字的范围
    //正则表达式
    NSString * pattern = @"\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]";
    NSError *error = nil;
    NSRegularExpression * re = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    if (!re) {
//        NSLog(@"%@", [error localizedDescription]);
    }
    
    //通过正则表达式来匹配字符串
    NSArray *resultArray = [re matchesInString:str options:0 range:NSMakeRange(0, str.length)];
//    NSLog(@"resultArray : %@", resultArray);
    
    //用来存放字典，字典中存储的是图片和图片对应的位置
    NSMutableArray *imageArray = [NSMutableArray arrayWithCapacity:resultArray.count];
    
    for(NSTextCheckingResult *match in resultArray) {
        //获取数组元素中得到range
        NSRange range = [match range];
        
        //获取原字符串中对应的值
        NSString *subStr = [str substringWithRange:range];
        
        for (int i = 0; i < arrEmoji.count; i ++)
        {
            if ([arrEmoji[i][@"chs"] isEqualToString:subStr])
            {
                
                //face[i][@"gif"]就是我们要加载的图片
                //新建文字附件来存放我们的图片
                NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
                //                    CGFloat n = 25/12;
                textAttachment.bounds = CGRectMake(textAttachment.bounds.origin.x, textAttachment.bounds.origin.y - 5, 25, 25);
                
                //给附件添加图片
                textAttachment.image = [UIImage imageNamed:arrEmoji[i][@"png"]];
                
                //把附件转换成可变字符串，用于替换掉源字符串中的表情文字
                NSAttributedString *imageStr = [NSAttributedString attributedStringWithAttachment:textAttachment];
                
                //把图片和图片对应的位置存入字典中
                NSMutableDictionary *imageDic = [NSMutableDictionary dictionaryWithCapacity:2];
                [imageDic setObject:imageStr forKey:@"image"];
                [imageDic setObject:[NSValue valueWithRange:range] forKey:@"range"];
                
                //把字典存入数组中
                [imageArray addObject:imageDic];
                
            }
        }
    }
    
    //从后往前替换
    for (NSInteger i = imageArray.count - 1; i >= 0; i--)
    {
        NSRange range;
        [imageArray[i][@"range"] getValue:&range];
        //进行替换
        [attributedString replaceCharactersInRange:range withAttributedString:imageArray[i][@"image"]];
        
    }
    [attributedString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.f]} range:NSMakeRange(0, attributedString.length)];
//    NSAttributedString *att = [NSAttributedString alloc] initWithString:<#(NSString *)#> attributes:<#(NSDictionary *)#>
    return attributedString;
}
+ (NSArray *) getEmojiArray
{
    NSString *file = [[NSBundle mainBundle] pathForResource:@"faceList" ofType:@"plist"];
    return [[NSArray alloc] initWithContentsOfFile:file];
}

+ (UIImage *)resizableImage:(UIImage *)image
{
    CGFloat top = image.size.height / 2; // 顶端盖高度
    CGFloat bottom = image.size.height / 2 ; // 底端盖高度
    CGFloat left = image.size.width / 2; // 左端盖宽度
    CGFloat right = image.size.width / 2; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    //    NSLog(@"resizableImage %@", NSStringFromCGSize(image.size));
    //    NSLog(@"resizableImage %@", image.description);
    // 指定为拉伸模式，伸缩后重新赋值 UIImageResizingModeStretch
    return [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
}

+ (CGSize) sizeWithText:(NSString *) text font:(UIFont *)font
{
    CGSize size;
//    double version = [UIDevice currentDevice].systemVersion.doubleValue;
//    if (version < 7.0) {
//        size = [text sizeWithFont:font constrainedToSize:CGSizeMake(200, 5000) lineBreakMode:NSLineBreakByCharWrapping];
    size = [text sizeWithFont:font constrainedToSize:CGSizeMake(310, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
//    }else if (version > 7.0)
//    {
//        NSDictionary *attribute = @{NSFontAttributeName:font};
//        size = [text boundingRectWithSize:CGSizeMake(150, 5000) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  attributes:attribute context:nil].size;
//    }
    return size;
}
+ (NSData *) dataWithUrlString:(NSString *) url
{
    return [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
}
/// sd
//sdf
//
+ (NSString *)MIMETypeForImageData:(NSData *)data {
    if (!data) return nil;
    
    uint8_t c;
    [data getBytes:&c length:1];
    
    switch (c) {
        case 0xFF:
            return @"image/jpeg";
        case 0x89:
            return @"image/png";
        case 0x47:
            return @"image/gif";
        case 0x49:
        case 0x4D:
            return @"image/tiff";
    }
    return nil;
}
+ (void) gifImageWithData:(NSData *)data
{
//    NSData *gifData = data;//[NSData dataWithContentsOfFile: gifFilePath];
//    NSMutableArray *frames = nil;
//    CGImageSourceRef src = CGImageSourceCreateWithData((CFDataRef)gifData, NULL);
//    double total = 0;
//    NSTimeInterval gifAnimationDuration;
//    if (src) {
//        size_t l = CGImageSourceGetCount(src);
//        if (l > 1){
//            frames = [NSMutableArray arrayWithCapacity: l];
//            for (size_t i = 0; i < l; i++) {
//                CGImageRef img = CGImageSourceCreateImageAtIndex(src, i, NULL);
//                NSDictionary *dict = (NSDictionary *)CGImageSourceCopyPropertiesAtIndex(src, 0, NULL);
//                if (dict){
//                    NSDictionary *tmpdict = [dict objectForKey: @"{GIF}"];
//                    total += [[tmpdict objectForKey: @"DelayTime"] doubleValue] * 100;
//                    [dict release];
//                }
//                if (img) {
//                    [frames addObject: [UIImage imageWithCGImage: img]];
//                    CGImageRelease(img);
//                }
//            }
//            gifAnimationDuration = total / 100;
//            
//            UIImageView *imageView = [[UIImageView alloc] init];
//            imageView.animationImages = frames;
//            imageView.animationDuration = gifAnimationDuration;
//            [imageView startAnimating];
//        }
}
+ (NSString *) getDateString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MM-dd HH:mm:ss";
    return [formatter stringFromDate:[NSDate date]];
}
@end
