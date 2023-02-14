//
//  ViewController.m
//  WL
//
//  Created by 李开强 on 2022/11/14.
//  Copyright © 2022 李开强. All rights reserved.
//

#import "ViewController.h"
#import "WLTableViewCell.h"
#import "WLDataModel.h"
#import <YYModel/YYModel.h>
#import "WL-Swift.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, WLTableViewCellDelegate, KLEditTextFieldDelegate>

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) WLDataModel* model;

@end


@implementation ViewController

// 读取本地JSON文件
- (WLDataModel *)readLocalFileWithName:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    NSString* jsonString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    WLDataModel* model = [WLDataModel yy_modelWithJSON:jsonData];
    return model;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"哈尔滨--中央大街--吃马迭尔";
    self.model = [self readLocalFileWithName:@"WLData"];

    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
    
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

// UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.model.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellID = @"WLTableViewCell_CustomView";
    WLTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[WLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    if (indexPath.row < [self.model.list count]) {
        cell.dataModel = [self.model.list objectAtIndex:indexPath.row];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

// UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    /**
     1.跳转类型，根据类型区分
     2.这个属于控件单层跳转，这个使用就可以，当页面层级较多，跳转区域密集 就得通过视图自定义代理实现
     */
//    WLProductDataModel* productData = [self.model.list objectAtIndex:indexPath.row];
//    NSLog(@" --- UITableViewDelegate --- %@", productData.productJumpType);
}

// WLTableViewCellDelegate
- (void)selectCellCustomWithData:(WLProductDataModel *)data {
//    NSLog(@" === Custom === %@", data.productName);
    
    KLSwiftViewController* swiftVc = [[KLSwiftViewController alloc] init];
    swiftVc.defaultText = data.productName;
    // 通过block块 带回数据
    swiftVc.myEidtorBlock = ^(NSString * str) {
        if (str.length > 0) {
            self.navigationItem.title = str;
        }
    };
    [self.navigationController pushViewController:swiftVc animated:YES];
    
    
}

- (void)selectCellImageWithData:(WLProductDataModel *)data {
    KLSwiftViewController* swiftVc = [[KLSwiftViewController alloc] init];
    // 通过代理 带回数据
    swiftVc.editorDelegate = self;
    [self.navigationController pushViewController:swiftVc animated:YES];
}

// KLEditTextFieldDelegate
- (void)editTextField:(NSString * _Nonnull)str {
    if (str.length > 0) {
        self.navigationItem.title = str;
    }
}

@end
