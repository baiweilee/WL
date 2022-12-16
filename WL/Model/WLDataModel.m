//
//  WLDataModel.m
//  WL
//
//  Created by 李开强 on 2022/11/14.
//  Copyright © 2022 李开强. All rights reserved.
//

#import "WLDataModel.h"

@implementation WLProductDataModel

@end


@implementation WLDataModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"list" : [WLProductDataModel class]};
}

@end
