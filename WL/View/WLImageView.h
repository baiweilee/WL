//
//  WLImageView.h
//  WL
//
//  Created by 李开强 on 2022/11/14.
//  Copyright © 2022 李开强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol WLImageViewDelegate <NSObject>

- (void)selectImageViewData:(WLProductDataModel *)model;

@end


@interface WLImageView : UIView

@property (nonatomic, strong) WLProductDataModel* productDataModel;

@property (nonatomic, weak) id <WLImageViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
