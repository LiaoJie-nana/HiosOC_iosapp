//
//  HONewsTableViewCell.m
//  HiosOC
//
//  Created by a on 2021/6/29.
//

#import "HONewsTableViewCell.h"
#import "HOListItem.h"
#import <SDWebImage.h>
#import "LikeButton.h"

@implementation HONewsTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self.contentView addSubview:({
            self.user_picImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
            //self.user_picImageView.backgroundColor = [UIColor redColor];
            self.user_picImageView;
        })];
        
        [self.contentView addSubview:({
            self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 10, 200, 20)];
            //self.nameLabel.backgroundColor = [UIColor redColor];
            self.nameLabel.font = [UIFont systemFontOfSize:16];
            self.nameLabel.textColor = [UIColor blackColor];
            self.nameLabel;
        })];
        
        [self.contentView addSubview:({
            self.verified_contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 40, 300, 20)];
            self.verified_contentLabel.font = [UIFont systemFontOfSize:12];
            self.verified_contentLabel.textColor = [UIColor grayColor];
            //self.verified_contentLabel.backgroundColor = [UIColor redColor];
            self.verified_contentLabel;
        })];
        
        
        [self.contentView addSubview:({
            self.image_urlImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 80, 300, 200)];
            self.image_urlImageView.contentMode = UIViewContentModeScaleAspectFit;
            //self.image_urlImageView.backgroundColor = [UIColor redColor];
            self.image_urlImageView;
        })];
        
        [self.contentView addSubview:({
            self.share_countButton = [[UIButton alloc]initWithFrame:CGRectMake(10,300, (self.contentView.frame.size.width-30)/3, 50)];
            //self.share_countButton.backgroundColor = [UIColor redColor];
        
            [self.share_countButton setImage:[UIImage imageNamed:@"share"] forState:0];
            [self.share_countButton setTitle:@"分享" forState:UIControlStateNormal];
            [self.share_countButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

            
            self.share_countButton;
        })];
        
        [self.contentView addSubview:({
            self.comment_countButton = [[UIButton alloc]initWithFrame:CGRectMake(15+(self.contentView.frame.size.width-30)/3,300, (self.contentView.frame.size.width-30)/3, 50)];
            //self.comment_countButton.backgroundColor =[UIColor blueColor];
            [self.comment_countButton setImage:[UIImage imageNamed:@"comment"] forState:0];
            [self.comment_countButton setTitle:@"评论" forState:UIControlStateNormal];
            [self.comment_countButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

            self.comment_countButton;
        })];
        
        //这里使用delegate做点赞动画响应，可能还要改数字？展示不改
        [self.contentView addSubview:({
            self.like_countButton = [LikeButton buttonWithType:UIButtonTypeCustom];
            //[[LikeButton alloc]initWithFrame:CGRectMake(160,300, 70, 50)];
            self.like_countButton.frame = CGRectMake(20+((self.contentView.frame.size.width-30)/3)*2,300, (self.contentView.frame.size.width-30)/3, 50);
            [self.like_countButton setImage:[UIImage imageNamed:@"like_before"] forState:0];
            //self.like_countButton.backgroundColor = [UIColor yellowColor];
            [self.like_countButton setTitle:@"点赞" forState:UIControlStateNormal];
            [self.like_countButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            //calaye

            self.like_countButton;
        })];
    }
    return self;
}

-(void) layoutTableViewCellWithItem:(HOListItem *)item{
    
    self.nameLabel.text = item.name;

    self.verified_contentLabel.text = [NSString stringWithFormat:@"%@",item.verified_content];
    

    
    [self.comment_countButton setTitle:[NSString stringWithFormat:@"%@",item.comment_count] forState:UIControlStateNormal];
    [self.share_countButton setTitle:[NSString stringWithFormat:@"%@",item.share_count] forState:UIControlStateNormal];
    [self.like_countButton setTitle:[NSString stringWithFormat:@"%@",item.like_count] forState:UIControlStateNormal];
    
    self.user_picImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.avatar_url]]];

    self.image_urlImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.image_url]]];
    
    
    /*
    [self.user_picImageView sd_setImageWithURL:[NSURL URLWithString:item.avatar_url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        NSLog(@"");
    }];
    [self.image_urlImageView sd_setImageWithURL:[NSURL URLWithString:item.image_url]];
    */

    
    
}

@end
