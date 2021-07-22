//
//  HONewsTableViewCell.h
//  HiosOC
//
//  Created by a on 2021/6/29.
//

#import <UIKit/UIKit.h>
#import "LikeButton.h"
@class HOListItem;

NS_ASSUME_NONNULL_BEGIN

@interface HONewsTableViewCell : UITableViewCell
@property(nonatomic,strong,readwrite) UILabel *contentLabel;
@property(nonatomic,strong,readwrite) UIImageView *user_picImageView;
@property(nonatomic,strong,readwrite) UILabel *nameLabel;
@property(nonatomic,strong,readwrite) UILabel *verified_contentLabel;
@property(nonatomic,strong,readwrite) UIButton *comment_countButton;
@property(nonatomic,strong,readwrite) UIButton *share_countButton;
//@property(nonatomic,strong,readwrite) UIButton *like_countButton;
@property(nonatomic,strong,readwrite) LikeButton *like_countButton;
@property(nonatomic,strong,readwrite) UIImageView *image_urlImageView;



//暴露方法
-(void) layoutTableViewCellWithItem:(HOListItem *)item;
@end

NS_ASSUME_NONNULL_END
