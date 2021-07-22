//
//  HOListItem.h
//  HiosOC
//
//  Created by a on 2021/6/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HOListItem : NSObject
@property(nonatomic,strong,readwrite) NSString *content;


@property(nonatomic,strong,readwrite) NSString *avatar_url;
@property(nonatomic,strong,readwrite) NSString *name;
@property(nonatomic,strong,readwrite) NSString *user_verified;
@property(nonatomic,strong,readwrite) NSNumber *verified_content;

@property(nonatomic,strong,readwrite) NSNumber *comment_count;
@property(nonatomic,strong,readwrite) NSNumber *share_count;
@property(nonatomic,strong,readwrite) NSNumber *like_count;
@property(nonatomic,strong,readwrite) NSString *image_url;


-(void)configWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
