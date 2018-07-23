//
//  ViewController.m
//  SinaWebioHeadView
//
//  Created by Don't update on 2018/7/23.
//  Copyright © 2018年 Don't update. All rights reserved.
//

#import "ViewController.h"
#import "FirstWayController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *list;
@end

@implementation ViewController

-(NSArray *)list{
    if (_list == nil) {
        _list = [[NSArray alloc]initWithObjects:@"通过设置两个相同的view 覆盖的方式实现", nil];
    }
    return _list;
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self list];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _list.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifity = @"identifity";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifity];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifity];
    }
    cell.textLabel.text = _list[indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            FirstWayController *firsVC =[[FirstWayController alloc]init];
            [self.navigationController pushViewController:firsVC animated:YES];
            }
            break;
            
        default:
            break;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self tableView];
}

-(void)viewWillAppear:(BOOL)animated{
   
}


@end
