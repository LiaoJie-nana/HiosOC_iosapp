//
//  HOdbmanager.m
//  HiosOC
//
//  Created by a on 2021/7/19.
//

#import "HOdbmanager.h"
#import "HOListItem.h"
#import <sqlite3.h>

@implementation HOdbmanager
static sqlite3 *db;


+(HOdbmanager*)dbmanager{
    static HOdbmanager *dbmanager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        dbmanager = [[HOdbmanager alloc] init];
        [dbmanager createDataBaseTableIfNeeded];
    });
    return dbmanager;
}

#pragma mark -private 创建数据库
-(void)createDataBaseTableIfNeeded{
        //虽然说我们的数据库是SQLite内置了，但是仍属于第三方，开发时如果想要使用它的类库，需要再进行配置添加
        //NameList配置文件-> TARGETS -> General -> LinkedFrameworks and Libraries,点击+号，搜书sqlit，选择libsqlite3.tbd。然后才能继续后续的操作。
        NSString * writetablePath =[self dataBaseFilePath];
        NSLog(@"数据库的地址是：%@",writetablePath);

        //打开数据库

        //第一个参数数据库文件所在的完整路径
        //第二个参数是数据库 DataBase 对象
        if (sqlite3_open([writetablePath UTF8String], &db) != SQLITE_OK) {

            //SQLITE_OK 是苹果为我们定义的一个常量如果是OK的话，就代表我们的数据库打开是成功了

            //失败
            //数据库关闭
            sqlite3_close(db);
            NSAssert(NO, @"数据库打开失败！");//抛出错误信息

        }else{

            //成功
            char * err;
            NSString * createSQL =[NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS StudentName (idNum TEXT PRIMARYKEY, name TEXT);"];
            //SQLite的执行函数
            /*
             第一个参数 db对象
             第二个参数 语句
             第三个和第四个参数 回调函数和回调函数参数
             第五个参数 是一个错误信息
             */
            if (sqlite3_exec(db, [createSQL UTF8String], NULL, NULL, &err) !=SQLITE_OK) {

                //失败
                //数据库关闭
                sqlite3_close(db);
                NSAssert1(NO, @"建表失败！%s", err);//抛出错误信息
            }
            sqlite3_close(db);
        }

}


//创建数据库表
-(BOOL)addTableWithName:(nonnull NSString *)tableName keys:(NSArray<NSString *>*)keys{
    return YES;
    
}
// 数据库文件存放所在的 Caches 文件夹路径
-(NSString *)dataBaseFilePath {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
     //把获取的存起来
    NSString *directory = [pathArray firstObject];
    NSString * filePath = [directory stringByAppendingPathComponent:@"SQLite.db"];
    return filePath;
}
//打开数据库
-(BOOL)openDataBase{
    NSString *dataBaseFilePath = [self dataBaseFilePath];
    int result = sqlite3_open([dataBaseFilePath UTF8String], &db);
    return result == SQLITE_OK;
}
//关闭数据库
-(BOOL)closeDataBase{
    int result = sqlite3_close(db);
    return result == SQLITE_OK;
}
/// 执行语句
-(BOOL)execSQLString:(nonnull NSString *)sqlStr {
    BOOL result = false ;
    
    // 打开数据库
    if ([self openDataBase]) {
        // 执行语句
        result = sqlite3_exec(db, [sqlStr UTF8String], NULL, NULL, NULL) == SQLITE_OK;
    }
    
    // 关闭数据库
    [self closeDataBase];
    
    return result ;
}

//插入数据
-(void) insertDataWithItem:(HOListItem*)item{
    
}
//查询 查询所有数据
/*
-(NSArray<HOListItem *> *)_readDataFromLocal{
    
}*/

@end
