//
//  HOVideoListItem.h
//  HiosOC
//
//  Created by a on 2021/7/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HOVideoListItem : NSObject
@property(nonatomic,strong,readwrite) NSNumber *like_count;

//key = detail_video_large_image
@property(nonatomic,strong,readwrite) NSString *url;
@property(nonatomic,strong,readwrite) NSNumber *width;
@property(nonatomic,strong,readwrite) NSNumber *height;

@property(nonatomic,strong,readwrite) NSString *video_url;
@property(nonatomic,strong,readwrite) NSNumber *share_count;
@property(nonatomic,strong,readwrite) NSString *abstract;
@property(nonatomic,strong,readwrite) NSNumber *comment_count;

//key = media_info
@property(nonatomic,strong,readwrite) NSString *avatar_url;
@property(nonatomic,strong,readwrite) NSString *name;
@property(nonatomic,strong,readwrite) NSNumber *user_verified;
@property(nonatomic,strong,readwrite) NSString *verified_content;

@property(nonatomic,strong,readwrite) NSNumber *video_duration;

-(void)configWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
