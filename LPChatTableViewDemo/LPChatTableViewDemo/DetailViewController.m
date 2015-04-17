//
//  DetailViewController.m
//  LPChatTableViewDemo
//
//  Created by lipeng on 15/4/17.
//  Copyright (c) 2015年 lipeng. All rights reserved.
//

#import "DetailViewController.h"
#import "LPTextSizeHelper.h"
#import "ACChatTableViewCell.h"


@interface DetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *messages;
@end

@implementation DetailViewController

static NSString *reuseIdentifier = @"Chat";

#pragma mark - Managing the detail item

// iOS 开发者群:361513739
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerClass:[ACChatTableViewCell class] forCellReuseIdentifier:reuseIdentifier];
    
    [self.view addSubview:_tableView];
    
    _messages = [NSMutableArray arrayWithCapacity:3];
    NSString *message = @"[开心][ss][^_^]【😄】】哦啊我今儿啊呜沙发上放假哦啊局外人温柔wrwqgvbarbASegasf 恐怕是发[开心][ss][^_^]【😄】】哦啊我今儿啊呜沙发上放假哦啊局外人温柔wrwqgvbarbASegasf 恐怕是发[开心][ss][^_^]【😄】】哦啊我今儿啊呜沙发上放假哦啊局外人温柔wrwqgvbarbASegasf 恐怕是发[开心][ss][^_^]【😄】】哦啊我今儿啊呜沙发上放假哦啊局外人温柔wrwqgvbarbASegasf 恐怕是发a [开心][ss][^_^]【😄】v[开心][ss][^_^]【😄】[开心][ss][^_^]【😄】jgj1124 [爱你][ss][敲头]😄哦恐[大兵]wrwqgvbarbASegasfwrwqgvbarbASegasfwrwqgvbarbASegasf放假哦啊局外\n[开心][ss][^_^]【😄】jgjs";
    for (int i = 0; i < 9; i ++) {
        NSDictionary *dicMessage = @{@"msgType":[NSNumber numberWithInteger:1], @"isMe":[NSNumber numberWithInteger:0], @"msgContent":(i % 2 == 0 ? @"[爱你][ss][敲头]😄哦恐[大兵] [爱你][ss][敲头]😄哦恐[大兵]wrwqgvbarbASegasfwrwqgvbarbASegasfwrwqgvbarbASegasf放假哦啊局外\n[开心][ss][^_^]【😄】jgjs[爱你][ss][敲头]😄哦恐[大兵]wrwqgvbarbASegasfwrwqgvbarbASegasfwrwqgvbarbASegasf放假哦啊局外\n[开心][ss][^_^]【😄】jgjsgasfwrwqgvbarbASegasfwrwqgvbarbASegasf放假哦啊局外\n[开心][ss][^_^]【😄】jgjs[爱你][ss][敲头]😄哦恐[大兵]wrwqgvbarbASegasfwrwqgvbarbASegasfwrwqgvbarbASegasf放假哦啊局外\n[开心][ss][^_^]【😄】jgjs去1 [爱你][ss][敲头]😄哦恐[大兵] [爱你][ss][敲头]😄哦恐[大兵]wrwqgvbarbASegasfwrwqgvbarbASegasfwrwqgvbarbASegasf放假哦啊局外\n[开心][ss][^_^]【😄】jgjs[爱你][ss][敲头]😄哦恐[大兵]wrwqgvbarbASegasfwrwqgvbarbASegasfwrwqgvbarbASegasf放假哦啊局外\n[开心][ss][^_^]【😄】jgjsgasfwrwqgvbarbASegasfwrwqgvbarbASegasf放假哦啊局外\n[开心][ss][^_^]【😄】jgjs[爱你][ss][敲头]😄哦恐[大兵]wrwqgvbarbASegasfwrwqgvbarbASegasfwrwqgvbarbASegasf放假哦啊局外\n[开心][ss][^_^]【😄】jgjs去1 YYYYY" : message)};
        LPTextSizeHelper *helper = [[LPTextSizeHelper alloc] init];
        [helper setMessageObject:dicMessage];
        //        cellHelper.textView = textview;
        [_messages addObject:helper];
    }
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _messages.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LPTextSizeHelper *helper = [_messages objectAtIndex:indexPath.row];
    
    return helper.contentSize.height + 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ACChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[ACChatTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    LPTextSizeHelper *helper = [_messages objectAtIndex:indexPath.row];
    [cell setHelper:helper];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
