//
//  HOdbmanager.h
//  HiosOC
//
//  Created by a on 2021/7/19.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@class HOListItem;

NS_ASSUME_NONNULL_BEGIN

@interface HOdbmanager : NSObject
@property(nonatomic,strong,readwrite) NSString *databasePath;
+(HOdbmanager*)dbmanager;

//创建数据库表
-(BOOL)addTableWithName:(nonnull NSString *)tableName keys:(NSArray<NSString *>*)keys;
// 数据库文件存放所在的 Caches 文件夹路径
-(NSString *)dataBaseFilePath ;
//打开数据库
-(BOOL)openDataBase;
//关闭数据库
-(BOOL)closeDataBase;
//执行语句
-(BOOL)execSQLString:(nonnull NSString *)sqlStr;
//插入数据
-(void) insertDataWithItem:(HOListItem*)item;
//查询 查询所有数据
//-(NSArray<HOListItem *> *)_readDataFromLocal;

@end

NS_ASSUME_NONNULL_END
