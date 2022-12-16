//
//  WLCustomView.h
//  WL
//
//  Created by 李开强 on 2022/11/14.
//  Copyright © 2022 李开强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLDataModel.h"

NS_ASSUME_NONNULL_BEGIN

//1:创建协议
@protocol WLCustomViewDelegate <NSObject>

- (void)selectViewWithData:(WLProductDataModel *)data;

@end



@interface WLCustomView : UIView

@property (nonatomic, strong) WLProductDataModel* productDataModel;

@property (nonatomic, weak) id <WLCustomViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
