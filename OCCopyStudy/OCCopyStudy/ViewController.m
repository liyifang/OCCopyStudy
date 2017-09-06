//
//  ViewController.m
//  OCCopyStudy
//
//  Created by liyifang on 2017/7/14.
//  Copyright © 2017年 liyifang. All rights reserved.
//

#import "ViewController.h"
#import "LWStringCopyStudyViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubViews];
}


//添加子视图
-(void)addSubViews
{
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    //设置代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
}
//UITableViewDelegate, UITableViewDataSource
//section数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger sectionNum = 1;
    return sectionNum;
}
//row数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rowNum = 1;
   
    return rowNum;
}
//tableViewCell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.textLabel.text = @"NSString(字符串)深浅拷贝探究";
    return cell;
}
//row高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rowHeight = 40;
    return rowHeight;
}

//分区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat headerHeight;
    return headerHeight;
}
//分区脚高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    CGFloat footerHeight;
    return footerHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LWStringCopyStudyViewController *stringCopyStudyViewController = [[LWStringCopyStudyViewController alloc]init];
    
    [self.navigationController pushViewController:stringCopyStudyViewController animated:YES];
}
@end
