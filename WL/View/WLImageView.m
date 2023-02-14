//
//  WLImageView.m
//  WL
//
//  Created by 李开强 on 2022/11/14.
//  Copyright © 2022 李开强. All rights reserved.
//

#import "WLImageView.h"
#import <SDWebImage/SDWebImage.h>

@interface WLImageView ()

@property (nonatomic, strong) UIImageView* pictureView;


@end


@implementation WLImageView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        
        [self addImageView];
    }
    return self;
}

- (void)addImageView {
    
    [self addSubview:self.pictureView];
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(selectImageView)];
    [self addGestureRecognizer:tap];
}


- (void)setProductDataModel:(WLProductDataModel *)productDataModel {
    _productDataModel = productDataModel;
    
    [self loadData];
}

- (void)loadData {
    
    [self.pictureView sd_setImageWithURL:[NSURL URLWithString:self.productDataModel.productImage]
                        placeholderImage:[UIImage imageNamed:@"12138"]];    
}

// 点击事件
- (void)selectImageView {
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectImageViewData:)]) {
        [self.delegate selectImageViewData:self.productDataModel];
    }
}

// 添加   控件
- (UIImageView *)pictureView {
    if (!_pictureView) {
        _pictureView = [[UIImageView alloc] init];
    }
    return _pictureView;
}

// 更新UI
- (void)layoutSubviews {
    self.pictureView.frame = CGRectMake(0,
                                        0,
                                        self.frame.size.width,
                                        self.frame.size.height);
}

@end
