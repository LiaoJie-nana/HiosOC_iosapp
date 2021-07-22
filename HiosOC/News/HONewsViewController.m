//
//  HONewsViewController.m
//  HiosOC
//
//  Created by a on 2021/6/29.
//

#import "HONewsViewController.h"
#import "HONewsTableViewCell.h"
#import "HOListLoader.h"
#import "HOListItem.h"


@interface HONewsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong,readwrite) UITableView *tableView;
@property(nonatomic,strong,readwrite) NSArray *dataArray;
@property(nonatomic,strong,readwrite) HOListLoader *listLoader;

@end

@implementation HONewsViewController

-(instancetype)init{
    self = [super init];
    if(self){
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    //加载真实数据
    self.listLoader = [[HOListLoader alloc]init];
    
    __weak typeof(self)wself = self;
    [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<HOListItem *> * _Nonnull dataArray) {
        __strong typeof(wself)strongSelf = wself;
        strongSelf.dataArray = dataArray;
        [strongSelf.tableView reloadData];
    }];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 360;//设置行高
}//2021063007:53 获得数据后在这里崩溃了，已修复，原因json解析转nsnumber，然后直接将nsnumber赋值给nsstring

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //这里是点击响应，暂时不用写
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
    
}

- (HONewsTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //uitableview重用
    HONewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if(!cell){
        cell = [[HONewsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    //调用方法
    [cell layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];
    
    //202106306:69 return cell crash
    
    return cell;
}


/*
- (HONewsTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //uitableview重用
    HONewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if(!cell){
        cell = [[HONewsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    //调用方法
    [cell layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];

    return cell;
}*/



@end
