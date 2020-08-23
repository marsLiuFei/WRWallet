//
//  WalletRowModel.m
//  wallet
//
//  Created by xc-ios on 2020/7/27.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WalletRowModel.h"

@implementation WalletRowModel

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title content:(NSString *)content rowTag:(NSInteger)rowTag {
    if (self = [super init]) {
        self.icon = icon;
        self.title = title;
        self.content = content;
        self.rowTag = rowTag;
        
    }
    return  self;
}

@end
