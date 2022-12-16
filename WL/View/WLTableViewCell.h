//
//  WLTableViewCell.h
//  WL
//
//  Created by 李开强 on 2022/11/14.
//  Copyright © 2022 李开强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol WLTableViewCellDelegate <NSObject>

- (void)selectCellCustomWithData:(WLProductDataModel *)data;
- (void)selectCellImageWithData:(WLProductDataModel *)data;

@end


@interface WLTableViewCell : UITableViewCell

@property (nonatomic, strong) WLProductDataModel* dataModel;

@property (nonatomic, weak) id <WLTableViewCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
