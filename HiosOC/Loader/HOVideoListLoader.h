//
//  HOVideoListLoader.h
//  HiosOC
//
//  Created by a on 2021/7/17.
//

#import <Foundation/Foundation.h>
@class HOVideoListItem;

NS_ASSUME_NONNULL_BEGIN

typedef void(^HOVideoListLoaderFinishBlock)(BOOL success,NSArray<HOVideoListItem *> *dataArray);

@interface HOVideoListLoader : NSObject
-(void)loadListDataWithFinishBlock:(HOVideoListLoaderFinishBlock)finishBlock;
@end

NS_ASSUME_NONNULL_END
