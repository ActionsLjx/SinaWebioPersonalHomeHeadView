//
//  FirstWayController.m
//  SinaWebioHeadView
//
//  Created by Don't update on 2018/7/23.
//  Copyright © 2018年 Don't update. All rights reserved.
//

#import "FirstWayController.h"
#import "HeadView.h"
@interface FirstWayController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *list;

@property(nonatomic,strong)HeadView *headView;
@property(nonatomic,strong)UISearchBar *search;
@end

@implementation FirstWayController


-(UISearchBar *)search{
    if (_search == nil) {
        _search = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 30)];
        _search.backgroundColor = [UIColor lightGrayColor];
     
    }
    return _search;
}

-(HeadView *)headView{
    if (_headView == nil) {
       _headView = [[HeadView alloc]initWithFrame:CGRectMake(0,-100, self.view.bounds.size.width, 300)];
    }
    return _headView;
}




-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 250, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
        [self list];
        [self headView];
        [self search];
        UIView  *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 250)];
        [view addSubview:_headView];
        [view addSubview:_search];
        _tableView.tableHeaderView = view;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

-(NSArray *)list{
    if (_list == nil) {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for (int i = 0; i<40; i++) {
            [arr addObject:[NSString stringWithFormat:@"%d",i]];
        }
        _list = [[NSArray alloc]init];
        _list = arr;
    }
    return _list;
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


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%f",scrollView.contentOffset.y);
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setHidden:NO];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

@end
