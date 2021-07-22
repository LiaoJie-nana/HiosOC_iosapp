//
//  HOListItem.m
//  HiosOC
//
//  Created by a on 2021/6/29.
//

#import "HOListItem.h"
@interface HOListItem()
//@property(nonatomic,strong,readwrite) NSString *mediainfo;
@end

@implementation HOListItem

-(void)configWithDictionary:(NSDictionary *)dictionary{
#warning 类型未检查匹配否
    self.content = [dictionary objectForKey:@"content"];
    
    self.avatar_url = [[dictionary objectForKey:@"media_info"] objectForKey:@"avatar_url"];
    self.name = [[dictionary objectForKey:@"media_info"] objectForKey:@"name"];
    self.verified_content = [[dictionary objectForKey:@"media_info"] objectForKey:@"verified_content"];
    self.user_verified = [[dictionary objectForKey:@"media_info"] objectForKey:@"user_verified"];

    
    
    self.comment_count = [dictionary objectForKey:@"comment_count"];
    self.share_count = [dictionary objectForKey:@"share_count"];
    self.like_count = [dictionary objectForKey:@"like_count"];
    self.image_url = [dictionary objectForKey:@"image_url"];
    
}

@end
