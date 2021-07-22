//
//  HOVideoViewController.m
//  HiosOC
//
//  Created by a on 2021/7/15.
//

#import "HOVideoViewController.h"
#import "HOVideoCoverCollectionViewCell.h"
#import "HOVideoToolbar.h"
#import "HOVideoListItem.h"
#import "HOVideoListLoader.h"

@interface HOVideoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong,readwrite)UICollectionView *collectview;
@property(nonatomic,strong,readwrite) NSArray *dataArray;
@property(nonatomic,strong,readwrite) HOVideoListLoader *videolistLoader;

@end

@implementation HOVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    flowlayout.minimumInteritemSpacing = 10;
    flowlayout.minimumLineSpacing = 10;
    flowlayout.itemSize = CGSizeMake(self.view.frame.size.width,self.view.frame.size.width/16*9 + HOVideoToolbarHeight);
    
    _collectview = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowlayout];
    
    _collectview.delegate = self;
    _collectview.dataSource = self;
    
    //注册
    [_collectview registerClass:[HOVideoCoverCollectionViewCell class] forCellWithReuseIdentifier:@"HOVideoCoverCollectionViewCell"];
    [self.view addSubview:_collectview];
    
    //加载真实数据
    self.videolistLoader = [[HOVideoListLoader alloc]init];
    
    __weak typeof(self)wself = self;
    [self.videolistLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<HOVideoListItem *> * _Nonnull dataArray) {
        __strong typeof(wself)strongSelf = wself;
        strongSelf.dataArray = dataArray;
        [strongSelf.collectview reloadData];
    }];
    
    
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //如果超出数组长度会报错  '*** __boundsFail: index 3 beyond bounds [0 .. 2]'
    return _dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HOVideoCoverCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor =[UIColor blueColor];
    if ([cell isKindOfClass:[HOVideoCoverCollectionViewCell class]]) {
        //赋值
        [((HOVideoCoverCollectionViewCell *)cell) layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];
    }
    return cell;
}

@end
