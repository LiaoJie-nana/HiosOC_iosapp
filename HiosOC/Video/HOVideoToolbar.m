//
//  HOVideoToolbar.m
//  HiosOC
//
//  Created by a on 2021/7/15.
//

#import "HOVideoToolbar.h"
@interface HOVideoToolbar()

@property(nonatomic,strong,readwrite) UIImageView *shareImageView;
@property(nonatomic,strong,readwrite) UILabel *shareLabel;

@property(nonatomic,strong,readwrite) UIImageView *commentImageView;
@property(nonatomic,strong,readwrite) UILabel *commentLabel;

@property(nonatomic,strong,readwrite) UIImageView *likeImageView;
@property(nonatomic,strong,readwrite) UILabel *likeLabel;


@end

@implementation HOVideoToolbar
-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:({
            _commentImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
            _commentImageView.layer.masksToBounds = YES;
            _commentImageView.layer.cornerRadius = 15;
            _commentImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _commentImageView;
        })];
        [self addSubview:({
            _commentLabel = [[UILabel alloc]init];
            _commentLabel.font = [UIFont systemFontOfSize:15];
            _commentLabel.textColor = [UIColor lightGrayColor];
            _commentLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _commentLabel;
        })];
        
        [self addSubview:({
            _likeImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
            _likeImageView.layer.masksToBounds = YES;
            _likeImageView.layer.cornerRadius = 15;
            _likeImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _likeImageView;
        })];
        [self addSubview:({
            _likeLabel = [[UILabel alloc]init];
            _likeLabel.font = [UIFont systemFontOfSize:15];
            _likeLabel.textColor = [UIColor lightGrayColor];
            _likeLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _likeLabel;
        })];
        
        [self addSubview:({
            _shareImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
            _shareImageView.layer.masksToBounds = YES;
            _shareImageView.layer.cornerRadius = 15;
            _shareImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _shareImageView;
        })];
        [self addSubview:({
            _shareLabel = [[UILabel alloc]init];
            _shareLabel.font = [UIFont systemFontOfSize:15];
            _shareLabel.textColor = [UIColor lightGrayColor];
            _shareLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _shareLabel;
        })];
        
    }
    return self;
}


-(void)layoutWithModel:(id)model{
    
    _commentImageView.image = [UIImage imageNamed:@"comment"];
    _commentLabel.text = @"评论";
    
    _likeImageView.image = [UIImage imageNamed:@"like_before"];
    _likeLabel.text = @"点赞";
    
    _shareImageView.image = [UIImage imageNamed:@"share"];
    _shareLabel.text = @"分享";
    
    NSString *vflString = @"H:|-15-[_commentImageView]-0-[_commentLabel]-15-[_likeImageView(==_commentImageView)]-0-[_likeLabel]-15-[_shareImageView(==_commentImageView)]-0-[_shareLabel]-15-|";
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vflString options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_commentImageView,_commentLabel,_likeImageView,_likeLabel,_shareImageView,_shareLabel)]];
    
}
@end
