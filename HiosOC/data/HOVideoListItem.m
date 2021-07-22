//
//  HOVideoListItem.m
//  HiosOC
//
//  Created by a on 2021/7/17.
//

#import "HOVideoListItem.h"
@interface HOVideoListItem()

@end

@implementation HOVideoListItem
-(void)configWithDictionary:(NSDictionary *)dictionary{
#warning 类型未检查匹配否
    self.like_count = [dictionary objectForKey:@"like_count"];
    
    self.url = [[dictionary objectForKey:@"detail_video_large_image"] objectForKey:@"url"];
    self.width = [[dictionary objectForKey:@"detail_video_large_image"] objectForKey:@"width"];
    self.height = [[dictionary objectForKey:@"detail_video_large_image"] objectForKey:@"height"];
    
    self.video_url = [dictionary objectForKey:@"video_url"];
    self.share_count = [dictionary objectForKey:@"share_count"];
    self.abstract = [dictionary objectForKey:@"abstract"];;
    self.comment_count = [dictionary objectForKey:@"comment_count"];;
    
    
    self.avatar_url = [[dictionary objectForKey:@"media_info"] objectForKey:@"avatar_url"];
    self.name = [[dictionary objectForKey:@"media_info"] objectForKey:@"name"];
    self.verified_content = [[dictionary objectForKey:@"media_info"] objectForKey:@"verified_content"];
    self.user_verified = [[dictionary objectForKey:@"media_info"] objectForKey:@"user_verified"];

    self.video_duration = [dictionary objectForKey:@"video_duration"];
    


    
}





@end
