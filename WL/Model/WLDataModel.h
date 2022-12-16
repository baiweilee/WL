//
//  WLDataModel.h
//  WL
//
//  Created by 李开强 on 2022/11/14.
//  Copyright © 2022 李开强. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface WLProductDataModel : NSObject

@property (nonatomic, copy) NSString* productId;
@property (nonatomic, copy) NSString* productName;
@property (nonatomic, copy) NSString* productJumpType;
@property (nonatomic, copy) NSString* productImage;
@end




@interface WLDataModel : NSObject

@property (nonatomic, copy) NSArray <WLProductDataModel *> *list;

@end


NS_ASSUME_NONNULL_END
