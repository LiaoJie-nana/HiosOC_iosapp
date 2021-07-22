//
//  HOVideoCoverCollectionViewCell.h
//  HiosOC
//
//  Created by a on 2021/7/15.
//

#import <UIKit/UIKit.h>
@class HOVideoListItem;
NS_ASSUME_NONNULL_BEGIN

@interface HOVideoCoverCollectionViewCell : UICollectionViewCell

-(void) layoutTableViewCellWithItem:(HOVideoListItem *)item;
@end
NS_ASSUME_NONNULL_END
