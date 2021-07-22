//
//  HOListLoader.h
//  HiosOC
//
//  Created by a on 2021/6/29.
//

#import <Foundation/Foundation.h>
@class HOListItem;

NS_ASSUME_NONNULL_BEGIN

typedef void(^HOListLoaderFinishBlock)(BOOL success,NSArray<HOListItem *> *dataArray);

@interface HOListLoader : NSObject
-(void)loadListDataWithFinishBlock:(HOListLoaderFinishBlock)finishBlock;
@end

NS_ASSUME_NONNULL_END
