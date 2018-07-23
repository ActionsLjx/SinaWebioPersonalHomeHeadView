//
//  HeadView.m
//  SinaWebioHeadView
//
//  Created by Don't update on 2018/7/23.
//  Copyright © 2018年 Don't update. All rights reserved.
//

#import "HeadView.h"
#import <Masonry.h>
@implementation HeadView


- (void)drawRect:(CGRect)rect {
    NSLog(@"绘制图形");
    UIImageView *background = [[UIImageView alloc]initWithFrame:self.bounds];
    background.image = [UIImage imageNamed:@"个人主页背景.jpg"];
    _background = background;
    [self addSubview:_background];
    
    UIImageView *headImage = [[UIImageView alloc]init];
    [_background addSubview:headImage];
    _headImg = headImage;
    _headImg.image = [UIImage imageNamed:@"headImg.jpg"];
    [_headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@80);
        make.height.equalTo(@80);
        make.left.equalTo(@(self.bounds.size.width/2-40));
        make.top.equalTo(@(self.bounds.size.height/3));
    }];
    
    UILabel *nickName = [[UILabel alloc]init];
    _nickName = nickName;
    [_nickName setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    _nickName.textColor = [UIColor whiteColor];
    _nickName.textAlignment = NSTextAlignmentCenter;
    [_background addSubview:_nickName];
    _nickName.text = @"我又何苦太苛求";
    [_nickName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@150);
        make.height.equalTo(@40);
        make.top.equalTo(_headImg.mas_bottom);
        make.centerX.equalTo(_headImg);
    }];
}


@end
