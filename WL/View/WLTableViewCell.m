//
//  WLTableViewCell.m
//  WL
//
//  Created by 李开强 on 2022/11/14.
//  Copyright © 2022 李开强. All rights reserved.
//

#import "WLTableViewCell.h"
#import "WLCustomView.h"
#import "WLImageView.h"


@interface WLTableViewCell () <WLCustomViewDelegate, WLImageViewDelegate>

@property (nonatomic, strong) WLCustomView* customView;
@property (nonatomic, strong) WLImageView* image;

@end


@implementation WLTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addCustomVIew];
    }
    return self;
}


- (void)addCustomVIew {
    [self addSubview:self.image];
    [self addSubview:self.customView];
}


- (void)setDataModel:(WLProductDataModel *)dataModel {
    _dataModel = dataModel;
    
    [self loadCellData];
}


- (void)loadCellData {
    self.image.productDataModel = self.dataModel;
    self.customView.productDataModel = self.dataModel;
}

// WLCustomViewDelegate
- (void)selectViewWithData:(WLProductDataModel *)data {
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectCellCustomWithData:)]) {
        [self.delegate selectCellCustomWithData:data];
    }
}

// WLImageViewDelegate
- (void)selectImageViewData:(WLProductDataModel *)model {
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectCellImageWithData:)]) {
        [self.delegate selectCellImageWithData:model];
    }
}

/**
 创建自定义视图，可以是多个，自行调整frame
 */
- (WLCustomView *)customView {
    if (!_customView) {
        _customView = [[WLCustomView alloc] initWithFrame:CGRectMake(self.frame.size.height,
                                                                     0,
                                                                     self.frame.size.width - self.frame.size.height,
                                                                     self.frame.size.height)];
        _customView.delegate = self;
    }
    return _customView;
}

- (WLImageView *)image {
 
    if (!_image) {
        _image = [[WLImageView alloc] initWithFrame:CGRectMake(0,
                                                               0,
                                                               self.frame.size.height,
                                                               self.frame.size.height)];
        _image.delegate = self;
    }
    return _image;
}


@end
