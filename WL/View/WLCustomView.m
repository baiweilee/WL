//
//  WLCustomView.m
//  WL
//
//  Created by 李开强 on 2022/11/14.
//  Copyright © 2022 李开强. All rights reserved.
//

#import "WLCustomView.h"


@interface WLCustomView ()

@property (nonatomic, strong) UILabel* titleLabel;

@end


@implementation WLCustomView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        [self addCustomView];
    }
    return self;
}

// 添加控件....
- (void) addCustomView {
    // 添加标题
    [self addSubview:self.titleLabel];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(selectCustomView)];
    [self addGestureRecognizer:tap];
}


// 接受数据 并 加载
- (void)setProductDataModel:(WLProductDataModel *)productDataModel {
    _productDataModel = productDataModel;
    
    [self loadCustomViewData];
}

// 控件赋值
- (void)loadCustomViewData {
    self.titleLabel.text = self.productDataModel.productName;
}

// 点击事件
- (void)selectCustomView {
    if (self.delegate && [self.delegate respondsToSelector: @selector(selectViewWithData:)]) {
        [self.delegate selectViewWithData:self.productDataModel];
    }
}

/**
 懒加载 创建控件
 之后随意添加 label button image ........
 */
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentRight;
        _titleLabel.font = [UIFont systemFontOfSize:22];
    }
    return _titleLabel;
}

// 更新UI
- (void)layoutSubviews {
    self.titleLabel.frame = CGRectMake(0,
                                       0,
                                       self.frame.size.width,
                                       self.frame.size.height);
}

@end
