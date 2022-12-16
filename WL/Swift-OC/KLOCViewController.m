//
//  KLOCViewController.m
//  WL
//
//  Created by 李开强 on 2022/11/30.
//  Copyright © 2022 李开强. All rights reserved.
//

#import "KLOCViewController.h"

@interface KLOCViewController ()

@end

@implementation KLOCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
}

- (void)setNavTitle:(NSString *)navTitle {
    _navTitle = navTitle;
    self.navigationItem.title = _navTitle;
}

@end
