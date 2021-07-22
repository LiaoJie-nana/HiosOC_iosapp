//
//  HOListLoader.m
//  HiosOC
//
//  Created by a on 2021/6/29.
//

#import "HOListLoader.h"
#import "HOListItem.h"
#import <sqlite3.h>
@interface HOListLoader()

@end

@implementation HOListLoader
-(void)loadListDataWithFinishBlock:(HOListLoaderFinishBlock)finishBlock{
    NSString *urlString = @"https://getman.cn/mock/newcomer/feed";
    NSURL *listURL = [NSURL URLWithString:urlString];
    
    NSURLSession *urlSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [urlSession dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];//返回的是数组
        NSLog(@"");
        
        
        
#warning 类型检查

        NSDictionary *dataArray = jsonObj;

        
        NSLog(@"");
        NSMutableArray *listItemArray = @[].mutableCopy;
        for (NSDictionary *info in dataArray) {
            if(info){
                HOListItem *listItem = [[HOListItem alloc]init];
                [listItem configWithDictionary:info];
                [listItemArray addObject:listItem];
            }

        }
        NSLog(@"");
        
       
        dispatch_async(dispatch_get_main_queue(), ^{
            if(finishBlock){
                finishBlock(error == nil,listItemArray.copy);
            }
        });
        
    }];
    [dataTask resume];
    NSLog(@"");
}
@end
